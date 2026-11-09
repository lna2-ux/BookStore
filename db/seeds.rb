# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'net/http'
require 'json'

# Clear existing records to start fresh
Book.destroy_all
Author.destroy_all

puts "Fetching books from Open Library API..."

queries = ["programming", "fiction", "history", "science", "mystery", "fantasy", "technology", "art"]

queries.each do |query|
  url = URI("https://openlibrary.org/search.json?q=#{URI.encode_www_form_component(query)}&limit=40")
  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  data['docs'].each do |doc|
    next unless doc['title'].present? && doc['author_name'].present?

    author_name = doc['author_name'].first

    author = Author.find_or_create_by!(name: author_name) do |a|
      a.bio = "An author known for works such as #{doc['title']}."
    end

    Book.find_or_create_by!(title: doc['title']) do |b|
      b.price = rand(15.0..50.0).round(2)
      b.published_year = doc['first_publish_year'] || 2000
      b.author = author
    end
  end
end

puts "Seeding complete! Created #{Author.count} authors and #{Book.count} books."
