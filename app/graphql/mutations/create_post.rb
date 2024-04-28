class Mutations::CreatePost < Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :content, String, required: true
  argument :parent_post_id, ID, required: false

  type Types::PostType

  def resolve(user_id:, content:, parent_post_id: nil)
    Post.create(
      user_id: user_id,
      content: content,
      parent_post_id: parent_post_id
    )
  end
end