class User < ApplicationRecord
  acts_as_reader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  
  #지원서
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  #알림
  has_many :new_notifications
  
 
  
  def is_apply?(post) 
    Apply.find_by(user_id: self.id, post_id: post.id).present? 
  end


end
