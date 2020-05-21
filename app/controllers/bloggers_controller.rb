class BloggersController < ApplicationController
    
    before_action :current_blogger, only: :show
    
    def index
        @bloggers = Blogger.all
    end

    def show

    end

    def current_blogger
        @blogger = Blogger.find(params[:id])
    end
end
