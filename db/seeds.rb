# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'open-uri'
require 'json'

url = "https://tmdb.lewagon.com/movie/top_rated"

# begin
  data_serialized = URI.open(url).read
  data = JSON.parse(data_serialized)
  puts "Successfully fetched and parsed #{data.length} records."

# rescue OpenURI::HTTPError => e
#   # Handle HTTP errors (e.g., 404, 500)
#   puts "ERROR: Could not fetch data from #{url}. HTTP Error: #{e.message}"
#   exit
# rescue JSON::ParserError => e
#   # Handle cases where the response is not valid JSON
#   puts "ERROR: Failed to parse JSON data. #{e.message}"
#   exit
# rescue => e
#   # Handle other potential errors
#   puts "An unexpected error occurred: #{e.message}"
#   exit
# end

puts "Starting database seeding..."

ActiveRecord::Base.transaction do
  data["results"].each do |movie|
    Movie.create!(
      title: movie["title"],
      director: movie["original_language"],
      overview: movie["overview"],
      poster_url: movie["poster_path"],
      rating: movie["vote_average"]
    )
  end
end
puts "Database seeding complete"
