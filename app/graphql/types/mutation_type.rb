# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :follow_user, mutation: Mutations::FollowUser
  end
end
