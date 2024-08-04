# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning data from Shifts...'
Shift.destroy_all
puts 'Cleaning data from Contracts...'
Contract.destroy_all
puts 'Cleaning data from Services...'
Service.destroy_all
puts 'Cleaning data from Weeks...'
Week.destroy_all

# Call seed files from db/seeds
seed_file_names = %i[weeks services contracts shifts]

seed_file_names.each do |file|
  file_path = Rails.root.join("db/seeds/#{file}_seed.rb")
  puts "Processing #{file_path}..."
  require file_path
end
