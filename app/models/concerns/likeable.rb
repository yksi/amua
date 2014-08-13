module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, class_name: 'Like', foreign_key: 'likeable_id'

    def like!(user_id)
      if !liked?(user_id)
        @like = Like.create!(user_id: user_id, likeable_type: self.class.name, likeable_id: self.id)
      else
        unlike!(user_id)
      end
    end

    def unlike!(user_id)
      @like = Like.where(user_id: user_id, likeable_type: self.class.name, likeable_id: self.id).first
      @like.destroy
    end

    def liked?(user_id)
      Like.where(user_id: user_id, likeable_id: self.id, likeable_type: self.class.name).count > 0
    end
  end

end