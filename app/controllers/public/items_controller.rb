class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

private
  # ストロングパラメータ
def item_params
    params.require(:genre).permit(:name,:genre_id,:introduction,:price,:is_active,:image)
end

end
