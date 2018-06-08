require 'csv'

namespace :data do
  # rake data:import_billboard_from_csv
  desc "Import Billboard data from CSV"
  task :import_billboard_from_csv => :environment do
    path = "#{Rails.root}/db/seed_data/billboard_voting_seed.csv"

    ImportService.import_billboard_from_csv(path)
  end

  # fileable.rb
  def delete_temp_file temp_file_name
    File.delete(temp_file_name)
  end

  def read_remote_file path, temp_file_name
    download = open(path)
    IO.copy_stream(download, temp_file_name)
    File.open(temp_file_name, 'rt')
  end
end