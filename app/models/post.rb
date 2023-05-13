class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :postscounter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def five_most_recent_posts
    Comment.limit(5).order(created_at: :desc).where(post: self)
  end

  private

  def update_post_counter
    author.increment!(:postscounter)
  end
end
