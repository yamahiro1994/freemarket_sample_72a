class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントしました'
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = '入力してください'
      redirect_to item_path(comment.item.id)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
      flash[:notice] = 'コメントを削除しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = '自分のコメント以外は削除できません'
      redirect_to item_path(comment.item.id)
    end
  end


  private

    def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end