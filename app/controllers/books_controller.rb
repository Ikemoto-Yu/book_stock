class BooksController < ApplicationController

  def index
    #@books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
  end

  private

  def book_params
    params.require(:book).permit(:name, :image, :info, :price, :published_on, :author_name, :category, :appearance)
  end
end
