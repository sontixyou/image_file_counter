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

  end
end
