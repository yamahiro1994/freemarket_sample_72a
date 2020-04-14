class Items::SearchesController < ApplicationController
  before_action :set_category
  def index
    @items = Item.search(params[:keyword]).page(params[:page]).per(12).order("created_at DESC")
    @keyword = params[:keyword]
  end

  private

  def set_category
    @parents = Category.where(ancestry: nil)
  end
end
