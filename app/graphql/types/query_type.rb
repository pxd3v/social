# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :posts, [Types::PostType], null: false do
      argument :users_id, [ID], required: false
    end
    def posts(users_id: [])
      if users_id.empty?
        return Post.all
      end

      Post.where(user_id: users_id )
    end

    field :timeline, [Types::PostType], null: false do
      argument :user_id, ID, required: true
    end
    def timeline(user_id:)
      user = User.includes(following: :posts).find(user_id)
      user.following.flat_map(&:posts)
    end
  end
end
