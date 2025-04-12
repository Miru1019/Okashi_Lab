class UsersController < ApplicationController
  def mypage
    @user = current_user
    @recipes = @user.recipes
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    if @user == current_user
      @user.destroy
      reset_session
      redirect_to new_user_registration_path, notice: 'アカウントを削除しました。'
    else
      redirect_to root_path, alert: '不正な操作です。'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :bio, :profile_image)
  end
end
