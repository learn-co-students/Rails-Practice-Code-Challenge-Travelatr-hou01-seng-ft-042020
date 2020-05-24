class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true
  validates :age, numericality: {only_integer: true, greater_than: 0}
  validates :bio, length: {minimum: 30}

#   @blogger.posts[0].likes

  def total_likes 
    sum = 0

    self.posts.each do |post|
      if post.likes
        sum += post.likes
      else
        post.likes = 0
      end
    end    
    sum
  end

end
