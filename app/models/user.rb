class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def most_recent_posts
    Post.limit(3).order(created_at: :desc).where(author: self)
  end
end
