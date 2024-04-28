class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: false

  type Types::UserType

  def resolve(username:, email: nil)
    User.create(
      username: username,
      email: email
    )
  end
end