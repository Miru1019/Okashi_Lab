class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def new
    @recipe = Recipe.new
  end

  def index
    @user = current_user
    @recipes = Recipe.all
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @newrecipe = Recipe.new
    @user = @recipe.user
  end

  def edit
    @recipe = Recipe.find(params[:id]) 
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:notice]="レシピが投稿されました"
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'レシピが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id]) 
    @recipe.destroy
    redirect_to mypage_path, notice: 'レシピを削除しました'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :image, :ingredients, :instructions)
  end
end
