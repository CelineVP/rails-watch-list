# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# movies = Movie.create([{ title: "Star Wars" }, { overview: "Lord of the Rings" },
#   { poster_url: "Star Wars" }, { rating: }, ])

require 'json'
require 'open-uri'

Movie.destroy_all

size = "/w500"
# poster_path =
url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)

movies_results = movies['results']
movies_results.each do |movie|
  Movie.create(
    { title: movie['title'],
      overview: movie['overview'],
      poster_url: movie["#{url}#{size}"],      #{poster_path}
      rating: movie['vote_average']}
  )
end

# List.create(name: "lolo")
