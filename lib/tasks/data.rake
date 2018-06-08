require 'csv'

namespace :data do
  # rake data:import_billboard_from_csv
  desc "Import Billboard data from CSV"
  task :import_billboard_from_csv => :environment do
    path = "#{Rails.root}/db/seed_data/billboard_voting_seed.csv"

    ImportService.import_billboard_from_csv(path)
  end
end