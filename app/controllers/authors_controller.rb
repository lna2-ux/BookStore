class AuthorsController < ApplicationController
  def index
    @authors = Author.page(params[:page]).per(10)
  end

  def show
    @author = Author.find(params[:id])
  end
end