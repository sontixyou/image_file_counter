module ImageFileCounter
  class Core
    def self.get_files_name
      file_name_array = []
      Dir.glob("./**/*") do |path|
	      next if FileTest.directory?(path)	# ディレクトリは無視
	      # puts path
        file_name_array << path
      end
      # puts file_name_array
      file_name_array
    end

    def self.select_image_files(files_path)
      return ['nothings'] if files_path.nil?

      select_image_files = files_path.select{|file| file.include?(".jpeg") || file.include?(".jpg") || file.include?(".png") || file.include?(".svg")}
      return "image files count is 0" if select_image_files.count.zero?

      select_image_files
    end

    def self.select_view_files_and_ruby_files(files_path)
      return [] if files_path.nil?

      view_files_and_rb_files = files_path.select{|file| file.include?(".rb") || file.include?(".html.haml")}
      return "view files and ruby files count is 0" if view_files_and_rb_files.count.zero?

      view_files_and_rb_files.map do |file|
        puts file
      end
    end
  end
end
