require "image_file_counter/core/get_files"
require "thor"

module ImageFileCounterUtils
  class CLI < Thor
    desc "camelize {snake_case_string}", "convert {snake_case_string} to {camelCaseString}"
    def convert_camelize_string(str)
      puts str.split("_").map{|w| w[0] = w[0].upcase; w}.join
    end

    desc "snake {CamelCaseString}", "convert {CamelCaseString} to {snake_case_string}"
    def convert_snake_case_string(str)
      puts str
        .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .tr("-", "_")
        .downcase
    end

    desc "get_files_name", "get files"
    def get_files_name
      file_name_array = ImageFileCounter::Core.get_files_name
    end

    desc "get_images_files", "get image files"
    def get_image_files
      files_name = ImageFileCounter::Core.get_files_name
      puts ImageFileCounter::Core.select_image_files(files_name)
    end

    desc "view_files_and_ruby_files", "get view files and ruby files"
    def get_view_files_and_ruby_files
      files_name = ImageFileCounter::Core.get_files_name
      ImageFileCounter::Core.select_view_files_and_ruby_files(files_name)
    end
  end
end
