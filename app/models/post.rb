class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :content, length: {minimum:100}

    # def order_by_recent
    #     self.order(:created_at desc).limit(5)
    # end

    def sum_likes
        self.map
        self.inject(0, :+)
    end


end
