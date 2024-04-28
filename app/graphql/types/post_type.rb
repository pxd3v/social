# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :parent_post, Types::PostType
    field :user, Types::UserType, null: false
    field :mentions, [Types::MentionType], null: true
    field :replies, [Types::PostType], null: true
    field :is_a_reply, Boolean, null: true
  end
end
