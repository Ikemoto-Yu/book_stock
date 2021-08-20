class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :params_bookid, only: [:index , :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order_orders_admin = OrderOrdersAdmin.new
  end

  def create
    @order_orders_admin = OrderOrdersAdmin.new(book_params)
    binding.pry
    if @order_orders_admin.valid?
      pay_book
      @order_orders_admin.save
      redirect_to root_path
    else
      render   'index'
    end
  end

  private

  def params_bookid
    @book = Book.find(params[:book_id])
  end

  def book_params
    params.require(:order_orders_admin).permit(:phone_number).merge(user_id: current_user.id, book_id: params[:book_id],token: params[:token])
  end

  def pay_book
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @book[:price],  # 商品の値段
        card: book_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_index
    unless @book.user.id != current_user.id || @book.orders_admin.nil?
      redirect_to root_path
    end
  end

end
