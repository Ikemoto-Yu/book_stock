class BooksController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]
  before_action :set_params_book , only: [:show, :destroy, :edit, :update]
  before_action :move_to_index , only: [:destroy,:edit,:update]

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
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
  end

  def destroy
    @book.destroy
    redirect_to action: :index
  end

  def edit
  end

  def update
    @book.update(book_params)
  end

  def search
    @books = Book.search(params[:keyword])
  end

  private

  def book_params
    params.require(:book).permit(:name, :info, :price, :published_on, :author_name, :category_id, :appearance_id, :image).merge(user_id: current_user.id)
  end

  def set_params_book
    @book = Book.find(params[:id])
  end

  def move_to_index
    unless @book.user.id = current_user.id
      redirect_to action: :index
    end
  end

end
