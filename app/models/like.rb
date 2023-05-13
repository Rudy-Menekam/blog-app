class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :likescounter
  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likescounter)
  end
end
