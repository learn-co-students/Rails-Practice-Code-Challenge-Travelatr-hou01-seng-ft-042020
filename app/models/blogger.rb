class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts 

validates :name, uniqueness: true 
validates :age, numericality: {greater_than: 0}
validates :bio, length: {minimum: 31}

def featured_post
    self.posts.max_by do |element| element.likes 
    end 
end 

def top_post(num)
    self.posts.max(num)
end 

def total_likes
    self.posts.map do |post| post.likes end.sum 
end 

def most_written
    self.destinations.max_by(5) do |destination| destination.posts.count end.uniq
end 

end
