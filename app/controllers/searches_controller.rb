class SearchesController < ApplicationController
  def index
    # 初期化
    @users = []
    @recipes = []

    # ユーザー検索
    if params[:model] == 'user' && params[:keyword].present?
      @users = User.where('name LIKE ?', "%#{params[:keyword]}%")
    # レシピ検索
    elsif params[:model] == 'recipe' && params[:keyword].present?
      @recipes = Recipe.where('title LIKE ?', "%#{params[:keyword]}%")
    end
  end
end
