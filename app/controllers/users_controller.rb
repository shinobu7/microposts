class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show # 追加
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user , notice: '作成しました'
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user , notice: '更新しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :location, :place)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    redirect_to root_path if @user != current_user
  end
end