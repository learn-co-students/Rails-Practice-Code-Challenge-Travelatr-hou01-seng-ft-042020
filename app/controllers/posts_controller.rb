class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = current_post
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end
    

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end 
    end

    def like
        @post = Post.find(params[:id])
        @post.add_like
        @post.save
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end

    end
    
    def current_post
        @post = Post.find(params[:id])
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :post_id, :destination_id)
    end
end
