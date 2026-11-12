class AboutController < ApplicationController
  def index
    @total_authors = Author.count
    @total_books = Book.count
    @total_categories = defined?(Category) ? Category.count : 0
  end
end