class Mutations::FollowUser < Mutations::BaseMutation
  argument :follower_id, ID, required: true
  argument :followed_id, ID, required: true

  type Types::UserType

  def resolve(follower_id:, followed_id:)
    follower = User.find(follower_id)
    followed = User.find(followed_id)
    followed.add_follower!(follower)
  end
end