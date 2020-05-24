class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def last_five
        self.posts.last(5)
    end

    def most_likes
        
        self.posts.max {|a,b| a.likes <=> b.likes }
    end

    def blogger_age
        total_age = 0
        self.bloggers.uniq.each do |blogger|
          
            total_age +=blogger.age
            # byebug
        end
    total_age/self.bloggers.uniq.length
    end
end
