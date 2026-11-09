class BooksController < ApplicationController
  def index
    @books = Book.includes(:author).all
  end

  def show
    @book = Book.find(params[:id])
  end
end