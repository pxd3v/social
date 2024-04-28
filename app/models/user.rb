class User < ApplicationRecord
  has_many :posts

  # persons that user is following
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Following'
  has_many :following, through: :following_relationships, source: :followed

  # persons that follow user
  has_many :followed_by_relationships, foreign_key: :followed_id, class_name: 'Following'
  has_many :followed_by, through: :followed_by_relationships, source: :follower


  def add_follower!(follower)
    if followed_by.include?(follower)
      message = "Follower #{follower.username} is already following this user."
      raise message
    end

    followed_by_relationships.create(follower: follower)
  end
end