class CommentsController < ApplicationController
  def create
  ＠comment = Comment.new(comment_params)
  if @comment.save
    flash[:notice] = 'コメントしました'
    redirect_back(fallback_location: item_comments_path)
  else
    flash[:notice] = '入力してください'
    render action: "show"
  end
end
  

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end