class FileService
  class << self
    def delete_temp_file temp_file_name
      File.delete(temp_file_name)
    end

    def read_remote_file path, temp_file_name
      download = open(path)
      IO.copy_stream(download, temp_file_name)
      File.open(temp_file_name, 'rt')
    end
  end
end