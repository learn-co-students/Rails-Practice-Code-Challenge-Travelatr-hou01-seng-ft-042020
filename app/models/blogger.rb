class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { only_integer: true, greater_than: 0}
    validates :bio, length: { minimum: 30 }

    def count_posts
        self.destinations.map do |dest|
            dest.posts.count
        end
    end
end
