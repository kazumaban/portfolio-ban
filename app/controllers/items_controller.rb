class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :item_find, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item[:id])
    else
      render :edit
    end
  end
  
  def show
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to root_path
  end

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
