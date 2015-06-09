class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]

  def edit
    @item = @comment.item
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item), notice: "Comment was created"
    else
      render :new, notice: "Something is wrong"
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to item_path(@comment.item), notice: 'Comment was updated'
    else
      render :new, notice: "Something is wrong"
    end
  end

  def destroy
    @comment.destroy
    redirect_to item_path(@comment.item), notice: "Comment was deleted"
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :item_id, :score)
  end
end