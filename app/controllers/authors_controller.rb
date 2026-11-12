class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:name).page(params[:page]).per(12)
    @categories = defined?(Category) ? Category.all : []
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books.page(params[:page]).per(8)
  end
end