class Public::HomesController < ApplicationController
def top
  @items = Item.all
  @genres = Genre.all
if params[:genre_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
  @genre = Genre.find(params[:genre_id])
end
end

def about
end
end

