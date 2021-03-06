class PostArticle < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

  attachment :image

  validates :body, presence: true, length: { minimum: 3 }

end
