class BooksController < ApplicationController
  before_action :move_to_index , only: [:destroy]

  def index
    @books = Book.order("created_at DESC")
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
      redirect_to root_path 
    else
      binding.pry
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to action: :index
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
  end

  private

  def book_params
    params.require(:book).permit(:name, :info, :price, :published_on, :author_name, :category_id, :appearance_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @book.user.id = current_user.id
      redirect_to action: :index
    end
  end

end
