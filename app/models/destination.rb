class Destination < ApplicationRecord
has_many :posts 
has_many :bloggers, through: :posts

def featured_post
    self.posts.max_by do |element| element.likes 
    end 
end 

def most_recent
    self.posts.sort_by{|a| a.created_at.to_i}[0...4]
end 

def average_age 
    self.bloggers.uniq.map do |blogger|
    blogger.age end.sum / self.bloggers.uniq.length
end 

end
