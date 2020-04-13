class CategoriesController < ApplicationController
  def index
  end

  def show
    @items = Item.order(id: :desc)
    @images = Image.includes(:item)
    @parents = Category.where(ancestry: nil)
  end

end
