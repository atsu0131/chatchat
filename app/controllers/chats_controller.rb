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
    Chat.create(set_chat)
    redirect_to new_chat_path
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def edit
    @chat = Chat.find(params[:id])
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
    @chat.destroy
    redirect_to chats_path, notice:"ブログを削除しました！"
  end

  def confirm
    @chat = Chat.new(set_chat)
     render :new if @chat.invalid?
  end

  private
  def set_chat
    params.require(:chat).permit(:content)
  end

end
