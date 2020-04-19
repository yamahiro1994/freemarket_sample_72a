class Items::SearchesController < ApplicationController
  before_action :set_category
  def index
    @keyword = params[:keyword]
    @category_parent_array = ["---"]
    @category_parent_array << @parents.pluck(:name)
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
