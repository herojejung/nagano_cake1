class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  if params[:genre_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
    @genre = Genre.find(params[:genre_id])
    @items = @genre.items
  end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
        @genres = Genre.all
  if params[:genre_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
    @genre = Genre.find(params[:genre_id])
    @items = @genre.items
  end
  end

private
  # ストロングパラメータ
def item_params
    params.require(:item).permit(:name,:genre_id,:introduction,:price,:is_active,:image)
end

end
