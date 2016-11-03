class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update]

  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit
  end

def update
    if @user.update(user_params)
      flash[:success] = "Updated your Plofile"
      redirect_to @user, notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'user'
    end
end

  def index
    @user = User.new
    @users = User.all
  end

  

private

def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
end

def set_user
    @user = User.find(params[:id])
end
end