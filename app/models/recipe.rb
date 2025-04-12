class Recipe < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  
  has_one_attached :image  # 画像を追加

  # 画像を取得するメソッドを追加
  def get_recipe_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
      nil
    end
  end
end
