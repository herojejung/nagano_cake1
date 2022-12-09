class Admin::ItemsController < ApplicationController

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  #binding.pry
if @item.save
  redirect_to admin_items_path
else
  render :new
end
end

def index
  @items = Item.all
end

def show
  @item = Item.find(params[:id])
end

def edit
end

end

private
  # ストロングパラメータ
def item_params
  params.require(:item).permit(:name, :introduction, :price, :image, :genre_id)
end
