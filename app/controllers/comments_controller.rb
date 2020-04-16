class CommentsController < ApplicationController
  before_action :current_user, only: [:destroy]
  def create
  if ＠comment = Comment.create(comment_params)
    flash[:notice] = 'コメントしました'
    redirect_back(fallback_location: item_comments_path)
  else
    flash[:notice] = '入力してください'
    redirect_to  item_comments_path
  end

  def destroy
    if @comment.destroy
      flash[:notice] = 'コメントを削除しました'
      redirect_back(fallback_location: item_comments_path)
    else
      flash[:notice] = '削除できません'
      redirect_to item_path
    end
  end
end
  

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def current_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end

end