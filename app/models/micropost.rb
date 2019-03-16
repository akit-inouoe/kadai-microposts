class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
    
  has_many :likes
  
  def like(user)
    like = Like.new(user_id: user.id, micropost_id: self.id)
    like.save!
  end

  def unlike(user)
    like = self.likes.find_by(user_id: user.id, micropost_id: self.id)
    like.destroy if like
  end
end
