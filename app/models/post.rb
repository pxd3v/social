class Post < ApplicationRecord
  belongs_to :user
  has_many :mentions
  belongs_to :parent_post, class_name: 'Post', optional: true
  has_many :replies, class_name: 'Post', foreign_key: 'parent_post_id'

  after_save :create_mentions

  def self.create(params)
    params[:is_a_reply] = params[:parent_post_id].present?

    super(params)
  end

  private
  def create_mentions
    content.scan(/@\w+/) do |mention|
      # [1..-1] remove the "@"
      username = mention[1..-1]

      user = User.find_by(username: username)

      unless user.nil?
        mentions.create({ user: user })
      end
    end

    mentions
  end
end
