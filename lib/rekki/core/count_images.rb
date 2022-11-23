# frozen_string_literal: true

module Rekki
  class Core
    VIEW_FILE_TYPES = /.html.haml|.slim|.erb|.htm/.freeze
    IMAGE_FILE_TYPES = /.webp|.jpeg|.jpg|.png|.svg/.freeze

    def self.generate_files_name
      files_path = []
      Dir.glob('./**/*') do |path|
        next if FileTest.directory?(path)	# ディレクトリは無視

        files_path << path
      end
      files_path
    end

    # rubocop:disable Metrics/CyclomaticComplexity
    def self.select_image_files(files_path)
      return 'Image files count is 0' if files_path.nil?

      select_image_files = files_path.select do |file|
        file.gsub!(%r{.[/0-9a-zA-Z_-]+/}, '') if file.include?('images') && file.match?(IMAGE_FILE_TYPES)
      end

      puts 'Image files count is 0' and return if select_image_files.count.zero? || select_image_files.nil?

      select_image_files
    end

    # rubocop:enable Metrics/CyclomaticComplexity
    def self.select_view_files_path(files_path)
      return 'View files and Ruby files count is 0' if files_path.nil?

      view_files_path = files_path.select do |file_path|
        !file_path.include?('node_modules') && file_path.match?(VIEW_FILE_TYPES)
      end

      puts 'View files and Ruby files count is 0' and return if view_files_path.count.zero? || view_files_path.nil?

      view_files_path
    end

    # select_view_files_and_ruby_filesからの返り値を使用して、それぞれのファイルでgrepを行う。
    # select_image_filesの画像がヒットするかを判別する。
    # ヒットした画像のパスが何回登場したのかを配列に持たせる。
    # できれば、それをグラフ化したい。簡易的ならこんな感じ
    # kojo: ********
    # aoki: ****
    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Metrics/AbcSize
    def self.count_images_in_view_file
      files_name = generate_files_name
      view_files_path = select_view_files_path(files_name)
      image_files_name = select_image_files(files_name)

      result = {}

      image_files_name.each do |image|
        image_count = 0
        view_files_path.each do |file_path|
          command = "rg \"#{image}\" #{file_path}"

          stdout, stderr, status = Open3.capture3(command)
          image_count += stdout.split("\n").count
        end
        result[image.to_s] = image_count
      end

      puts 'IMAGE COUNT RESULT'
      result.each do |k, v|
        puts "#{k}: #{'*' * v}"
      end
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize

    # count_images_in_view_file is too slow. image_counter_in_all_views is Created with the goal of speeding up processing time.
    def self.image_counter_in_all_views
      require 'fileutils'

      files_name = generate_files_name
      view_files_path = select_view_files_path(files_name)
      image_files_path = select_image_files(files_name)
      image_files_regex = Regexp.union(image_files_path)

      result = search_image_files(view_files_path, image_files_regex)
      unsued_image_files = image_files_path - result
      report_result(unsued_image_files)
    end

    private

    def search_image_files(view_files_path, image_files_regex)
      result = []
      view_files_path.each do |file_path|
        File.open(file_path, 'r').each_line do |read_line|
          hit_string = read_line.match(image_files_regex).to_s
          result << hit_string unless hit_string.empty? || result.include?(hit_string)
        end
      end
      result
    end

    def report_result(unsued_image_files)
      puts 'UNUSED IMAGE IS NOTHING' and return if unsued_image_files.empty?

      result_head_message = <<-SUMMARY
        UNUSED IMAGES LIST
        ===================
      SUMMARY

      puts result_head_message
      unsued_image_files.each { |image| puts image }
      puts '==================='
    end
  end
end
