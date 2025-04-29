# app/controllers/comments_controller.rb
class Public::CommentsController < ApplicationController
  before_action :authenticate_user!  # ログインユーザーの確認

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to recipe_path(@recipe), notice: 'コメントが投稿されました。'
    else
      redirect_to recipe_path(@recipe), alert: 'コメントの投稿に失敗しました。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @recipe = @comment.recipe

    if @comment.user == current_user
      @comment.destroy
      redirect_to recipe_path(@recipe), notice: 'コメントが削除されました。'
    else
      redirect_to recipe_path(@recipe), alert: 'コメント削除は自分のコメントのみ可能です。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
