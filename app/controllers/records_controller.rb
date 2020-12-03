class RecordsController < ApplicationController
  before_action :move_to_index, only: [:index, :create]
  before_action :item_id, only: [:index, :create]
  before_action :soldout, only:[:index, :create]


  def index
    @shopping = Shopping.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @shopping = Shopping.new(shopping_params)
    if @shopping.valid?
       pay_item
       @shopping.save
       redirect_to root_path
    else
      render :index
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def soldout
    if @item.record
      redirect_to root_path
    end
  end

  def item_id
    @item = Item.find(params[:item_id])
  end

  private

  def shopping_params
    params.require(:shopping).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: shopping_params[:token],
      currency: 'jpy'
    )
  end

end
