class BookmarksController < ApplicationController

  def create
    bookmark = current_user.bookmarks.build(item_id: params[:item_id])
    bookmark.save
    # redirect_to item_path
    redirect_to items_path
  end

  def destroy
    bookmark = Bookmark.find_by(item_id: params[:item_id], user_id: current_user.id)
    bookmark.destroy
    redirect_to items_path
  end

end
