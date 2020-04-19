class Items::SearchesController < ApplicationController
  before_action :set_category
  def index
    @keyword = params[:keyword]
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    if params[:q].present?
      @q = Item.ransack(params[:q])
      @items = @q.result(distinct: true).page(params[:page]).per(12).order("created_at DESC")
    else
      params[:q] = { sorts: 'id desc' }
      @q = Item.ransack(params[:q])
      @items = Item.search(params[:keyword]).page(params[:page]).per(12).order("created_at DESC")
    end
  end

  private

  def set_category
    @parents = Category.where(ancestry: nil)
  end
end
