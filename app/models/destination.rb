class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def avg_age
        total_age = 0
        self.bloggers.uniq.each do |blogger|
            total_age += blogger.age
        end
        total_age/self.bloggers.length
    end

    def most_recent
        self.posts.last(5).map {|post| post.title}
    end

    def most_like
        self.posts.max{ |a,b| a.likes <=> b.likes }
    end
end
