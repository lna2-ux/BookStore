class BooksController < ApplicationController
  def index
    if params[:query].present?
      # Filters books by title if a search query is entered, with pagination
      @books = Book.where("title LIKE ?", "%#{params[:query]}%").page(params[:page])
    else
      # Loads all books with pagination if no search query is present
      @books = Book.page(params[:page])
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end