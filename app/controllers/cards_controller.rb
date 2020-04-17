class CardsController < ApplicationController
  require "payjp"
  before_action :set_card
  before_action :set_category


  def index
    if @card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(customer.default_card)
      @card_brand = @card_info.brand
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      case @card_brand
      when "Visa"
        @card_image = "credit-visa.svg"
      when "JCB"
        @card_image = "credit-jcb.svg"
      when "MasterCard"
        @card_image = "credit-master-card.svg"
      when "American Express"
        @card_image = "credit-american_express.svg"
      when "Diners Club"
        @card_image = "credit-dinersclub.svg"
      when "Discover"
        @card_image = "credit-discover.svg"
      when "Saison"
        @card_image = "credit-saison-card.svg"
      end
    end
  end

  def new
    @card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if @card.present?
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    if params['payjpToken'].blank?
      flash[:notice] = 'クレジットカード登録ができません'
      render "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id)
      if @card.save
        if request.referer&.include?("/registrations/step5")
          redirect_to controller: 'registrations', action: "step6"
        else
          flash[:notice] = "支払い情報の登録が完了しました"
          redirect_to action: "index"
        end
      else
        flash[:notice] = 'クレジットカード登録ができません'
        render 'new'
      end
    end
  end

  def destroy
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      flash[:notice] = "削除しました"
      redirect_to action: "index"
    else
      flash[:notice] = "削除できませんでした"
      redirect_to action: "index"
    end
  end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
  def set_category
    @parents = Category.where(ancestry: nil)
  end
end
