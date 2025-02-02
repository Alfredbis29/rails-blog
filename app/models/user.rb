class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: true

  def self.three_most_recent_posts(author_id)
    Post.where(author_id:).order(created_at: :desc).limit(3).all
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
