class ItemsController < ApplicationController
  before_action :authenticate_user! ,except:[:index, :show]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :price, :shipping_fee_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    redirect_to(root_url) unless current_user == @item.user
  end
end
