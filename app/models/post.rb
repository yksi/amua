class Post < ActiveRecord::Base
  include Likeable
  include Commentable

  belongs_to :user
  belongs_to :owner, class_name: 'User'

  def can_delete?(user)
    ( self.user == user ) or ( self.owner == user )
  end

end