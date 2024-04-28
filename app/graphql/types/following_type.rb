# frozen_string_literal: true

module Types
  class FollowingType < Types::BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :follower, Types::UserType, null: false
    field :followed, Types::UserType, null: false
  end
end
