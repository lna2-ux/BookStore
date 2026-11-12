class BooksController < ApplicationController
  def index
    # Safely fetch categories if the Category model exists
    @categories = defined?(Category) ? Category.all : []

    # Eager load author and category for better performance
    @books = Book.includes(:author, :category).all

    # Filter by search query if present
    if params[:query].present?
      @books = @books.where("title LIKE ?", "%#{params[:query]}%")
    end

    # Filter by category if selected
    if params[:category_id].present?
      @books = @books.where(category_id: params[:category_id])
    end

    # Paginate results
    @books = @books.page(params[:page]).per(10)
  end

  def show
    @book = Book.find(params[:id])
  end
end