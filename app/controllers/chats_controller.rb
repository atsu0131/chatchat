class ChatsController < ApplicationController
  before_action :require_user_logged_in,{only:[:index,:new,:show,:edit]}

  def index
    @chats = Chat.all
  end

  def new
    if params[:back]
      @chat = Chat.new(set_chat)
    else
      @chat = Chat.new
    end
  end

  def create
    @chat = Chat.new(set_chat)
    @chat.user_id = current_user.id
    if @chat.save
      ChatMailer.chat_mail(@chat).deliver
      redirect_to new_chat_path
    else
      redirect_to new_chat_path
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @favorite = current_user.favorites.find_by(chat_id:@chat.id)

  end

  def edit
    @chat = Chat.find(params[:id])
    unless @chat.user_id == current_user.id
      redirect_to chats_path
    end
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(set_chat)
      redirect_to chats_path, notice:"編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    if @chat.user_id == current_user.id
      @chat.destroy
      redirect_to chats_path, notice:"ブログを削除しました！"
    end
  end

  def confirm
    @chat = Chat.new(set_chat)
    @chat.user_id = current_user.id
     render :new if @chat.invalid?
  end

  private

  def set_chat
    params.require(:chat).permit(:content)
  end

end
