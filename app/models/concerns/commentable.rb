module Commentable
  extend ActiveSupport::Concern

  included do

    has_many :comments, class_name: 'Comment', foreign_key: 'commentable_id'

    def comment(content, user)
      Comment.create!(commentable_type: self.class.name, commentable_id: self.id, content: content, user_id: user.id)
    end

  end
end