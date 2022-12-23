class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

private
  # ストロングパラメータ
def item_params
    params.require(:item).permit(:name,:genre_id,:introduction,:price,:is_active,:image)
end

end
