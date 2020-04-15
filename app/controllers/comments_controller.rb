class CommentsController < ApplicationController
  def create
    if ＠comment = Comment.create(comment_params)
      flash[:notice] = 'コメントしました'
      redirect_back(fallback_location: item_comments_path)
    else
      flash[:notice] = '入力してください'
      redirect_to action: "show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end