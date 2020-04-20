class CategoriesController < ApplicationController
  before_action :set_categories

  def index
  end

  def show
    @category = Category.find(params[:id])
    case params[:id]
    when @category.root.id.to_s
      grandchild_array = @category.indirect_ids
    when @category.id.to_s
      grandchild_array = params[:id]
    else
      grandchild_array = @category.children.ids
    end
    @items = Item.order(id: :desc).where(category_id: grandchild_array)
    @images = Image.includes(:item)
  end

  private

  def set_categories
    @parents = Category.where(ancestry: nil)
  end

end
