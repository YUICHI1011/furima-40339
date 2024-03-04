class ItemsController < ApplicationController
  before_action :authenticate_user! ,except:[:index]
  
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :price, :user, :hipping_free_id, :prefecture_id, :shipping_day_id)
  end

end
