class PostsController < ApplicationController
    before_action :current_post, only: :show
    
    def index
        @posts = Post.all
    end

    def show
    end

    def current_post
        @post = Post.find(params[:id])
    end

end
