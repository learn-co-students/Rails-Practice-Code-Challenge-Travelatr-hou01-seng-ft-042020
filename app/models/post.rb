class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :content, length: {minimum:100}
    validates :title, presence: true

    def add_like
        self.likes += 1
    end

end
