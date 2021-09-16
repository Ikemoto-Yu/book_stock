class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params)
    if @comment.valid?
      @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    else
      render 'show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,book_id: params[:book_id])
  end

end
