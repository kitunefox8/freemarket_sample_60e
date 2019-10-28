class CommentsController < ApplicationController
  def create
      @comment = Comment.new(comment: comment_params[:comment], product_id: comment_params[:product_id], user_id: current_user.id)
    if @comment.comment.blank?
      redirect_to product_path(@comment.product.id)
    else
      @comment.save
      redirect_to product_path(@comment.product.id)
    end


    
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(product_id:params[:product_id])
  end
end
