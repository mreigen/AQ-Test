class ImportService
  class << self
    def import_billboard_from_csv(path)
      temp_file_name = 'test.csv'
      file = read_remote_file(path, temp_file_name)

      body = file.read
      body.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')

      array = parse_csv_file_content(body)
      array.each do |hsh|
        name = hsh["Name"]
        image_url = hsh["Image"]
        next if name.blank? || image_url.blank?
        creation_hsh = {
          name: name,
          image_url: image_url,
          source: 'CSV'
        }
        Billboard.create!(creation_hsh)
      end

      delete_temp_file temp_file_name
    end

    def parse_csv_file_content(body)
      quote_chars = %w(" | ~ ^ & *)
      begin
        array = CSV.new(body, headers: true, quote_char: quote_chars.shift, :row_sep => :auto, :col_sep => ",").map(&:to_hash)
      rescue  CSV::MalformedCSVError
        quote_chars.empty? ? raise : retry
      end
      array
    end
  end
end