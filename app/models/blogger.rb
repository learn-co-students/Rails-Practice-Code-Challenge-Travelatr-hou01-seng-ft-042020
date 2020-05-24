class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true, presence: true
    validates :age, numericality: {only_integer: true, greater_than: 0}
    validates :bio, length: {minimum:30}

    def total_likes
        total = 0
        self.posts.each do |post|
            if post.likes
                total += post.likes
            else
                post.likes = 0
            end
        end
        total
    end
end
