class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        

        has_one_attached :profile_image
        has_many :recipes, dependent: :destroy
        has_many :comments, dependent: :destroy

        validates :name, presence: true
        validates :email, presence: true

        def get_profile_image(width, height)
          if profile_image.attached?
            profile_image.variant(resize_to_fill: [width, height]).processed
          else
            'no_image.png'
          end
        end
      end
