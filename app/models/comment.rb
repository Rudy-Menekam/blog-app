class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :commentscounter
  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:commentscounter)
  end
end
