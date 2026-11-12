# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'net/http'
require 'json'

# Clear existing records to start fresh (Order matters due to foreign keys)
Book.destroy_all
Category.destroy_all
Author.destroy_all

puts "Creating categories..."

# Define category mappings for queries
category_mapping = {
  "programming" => "Programming & Tech",
  "fiction" => "Fiction & Novels",
  "history" => "History",
  "science" => "Science & Math",
  "mystery" => "Mystery",
  "fantasy" => "Fantasy",
  "technology" => "Programming & Tech",
  "art" => "Art & Design"
}

category_records = {}
category_mapping.values.uniq.each do |cat_name|
  category_records[cat_name] = Category.create!(name: cat_name)
end

puts "Fetching books from Open Library API..."

category_mapping.each do |query, cat_name|
  category = category_records[cat_name]

  url = URI("https://openlibrary.org/search.json?q=#{URI.encode_www_form_component(query)}&limit=25")
  response = Net::HTTP.get(url)
  data = JSON.parse(response) rescue {}

  next unless data['docs'].present?

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
      b.category = category
    end
  end
end

puts "Seeding complete! Created #{Category.count} categories, #{Author.count} authors, and #{Book.count} books."