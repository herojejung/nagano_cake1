class Admin::ItemsController < ApplicationController

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  #binding.pry
if @item.save
  redirect_to admin_item_path(@item)
else
  render :new
end
end

def index
  @items = Item.page(params[:page]).per(10)
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
  redirect_to admin_item_path
end
end

private
  # ストロングパラメータ
def item_params
  params.require(:item).permit(:id, :name, :introduction, :price, :image, :genre_id, :is_active)
end
end
