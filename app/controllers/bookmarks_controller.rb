class BookmarksController < ApplicationController

  def create
    bookmark = current_user.bookmarks.build(item_id: params[:item_id])
    if bookmark.save
      redirect_to items_path
    else
      flash[:notice] = 'うまく保存出来ませんでした'
      redirect_to items_path
    end
  end

  def destroy
    bookmark = Bookmark.find_by(item_id: params[:item_id], user_id: current_user.id)
    if bookmark.destroy
      redirect_to items_path
    else
      flash[:notice] = 'うまく削除出来ませんでした'
      redirect_to items_path   
    end
  end
end
