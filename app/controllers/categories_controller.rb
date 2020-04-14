class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    if params[:id] == @category.root.id.to_s
      a = @category.indirect_ids
    elsif  params[:id] == @category.parent.id.to_s
      a = @category.child.ids
    else
      a = params[:id]
    end
    @items = Item.order(id: :desc).where(category_id:a)
    @images = Image.includes(:item)
    @parents = Category.where(ancestry: nil)
  end

end
