class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :first_name, presenсe: true
  validate :last_name, presenсe: true
  has_many :posts
  has_many :owned_posts, class_name: 'Post', foreign_key: 'owner_id'

  def fullname
    if first_name.present? and last_name.present?
      "#{first_name} #{last_name}, id = #{id}"
    else
      email
    end
  end
end
