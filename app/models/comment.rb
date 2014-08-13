class Comment < ActiveRecord::Base
  include Likeable
  belongs_to :user

  def commentable
    commentable_type.titleize.constantize.find(commentable_id)
  end

  def can_delete?(user)
    ( self.user == user ) or ( self.commentable.owner == user )
  end
end