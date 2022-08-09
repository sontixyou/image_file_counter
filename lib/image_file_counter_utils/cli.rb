require "image_file_counter"
require "thor"

module ImageFileCounterUtils
  class CLI < Thor
    desc "camelize {snake_case_string}", "convert {snake_case_string} to {camelCaseString}"
    def camelize(str)
      puts str.split("_").map{|w| w[0] = w[0].upcase; w}.join
    end

    desc "snake {CamelCaseString}", "convert {CamelCaseString} to {snake_case_string}"
    def snake(str)
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
  end
end
