class BooksController < ApplicationController
  def index
    @books = Book.includes(:author)
    
    # Simple Search (Feature 4.1)
    if params[:search].present?
      @books = @books.where("title LIKE ?", "%#{params[:search]}%")
    end

    # Hierarchical Filter by Author (Feature 4.2)
    if params[:author_id].present?
      @books = @books.where(author_id: params[:author_id])
    end

    # Pagination (Feature 3.5)
    @books = @books.page(params[:page]).per(20)
    @authors = Author.order(:name)
  end

  def show
    @book = Book.find(params[:id])
  end
end