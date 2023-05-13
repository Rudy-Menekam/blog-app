class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :postscounter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :update_post_counter

  def five_most_recent_posts
    Comment.limit(5).order(created_at: :desc).where(post: self)
  end

  private

  def update_post_counter
    author.increment!(:postscounter)
  end
end
