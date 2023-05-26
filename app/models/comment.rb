class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_save :update_post_comment_counter
  after_destroy :decrement_post_comment_counter

  private

  def update_post_comment_counter
    post.increment!(:commentscounter)
  end

  def decrement_post_comment_counter
    post.decrement!(:commentscounter)
  end
end
