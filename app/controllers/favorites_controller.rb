class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(chat_id: params[:chat_id])
    redirect_to chats_url, notice: "#{favorite.chat.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to chats_url, notice: "#{favorite.chat.user.name}さんのブログをお気に入り解除しました"
  end
end
