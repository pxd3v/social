class Post < ApplicationRecord
  belongs_to_required_by_default :user
end
