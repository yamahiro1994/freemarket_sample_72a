class DraftsController < ApplicationController
  before_action :set_category
  def index
    @drafts = Draft.all
    @parents = Category.where(ancestry: nil)
  end

  def new
    @draft = Draft.new
  end

  def create
    @draft = Draft.new(item_params)
    if @draft.save
      flash[:notice] = '下書きに保存しました'
      redirect_to root_path
    else
      flash[:notice] = '下書き保存に失敗しました'
      render :new
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = '出品しました'
      redirect_to root_path
    else
      flash[:notice] = '必須項目を入力してください'
      render :new
    end
  end


  private
  def set_category
    @parents = Category.where(ancestry: nil)
  end
end
