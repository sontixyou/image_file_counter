# frozen_string_literal: true

require 'rekki/core/count_images'
require 'thor'
require 'open3'

module RekkiUtils
  class CLI < Thor
    desc 'get_files_name', 'Get files'
    def generate_files_name
      Rekki::Core.generate_files_name
    end

    desc 'get_images_files', 'Get image files'
    def generate_image_files
      files_name = Rekki::Core.generate_files_name
      Rekki::Core.select_image_files(files_name)
    end

    desc 'view_files_and_ruby_files', 'Get view files and ruby files'
    def generate_view_files_path
      files_name = Rekki::Core.generate_files_name
      Rekki::Core.select_view_files_path(files_name)
    end

    desc 'count_image_file_in_files', 'Count image file in files'
    def count_image_file_in_files
      Rekki::Core.count_images_in_view_file
    end

    desc 'count_image_file_in_files_FIX-VERSION', 'Count image file in files_FIX-VERSION'
    def image_counter_in_all_views
      Rekki::Core.image_counter_in_all_views
    end
  end
end
