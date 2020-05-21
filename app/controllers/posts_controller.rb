class PostsController < ApplicationController 
    before_action :current_post, only: [:show, :edit, :update]

    def show 
    end 

    def new 
        @post=Post.new 
        @bloggers=Blogger.all 
        @destinations=Destination.all 
    end 

    def create 
        post=Post.new(posts_params)
        post.likes=0
        if post.valid?
            post.save 
            redirect_to post 
        else 
            flash[:errors]=post.errors.full_messages 
            redirect_to "/posts/new"
        end 
    end 

    def edit 
        @bloggers=Blogger.all 
        @destinations=Destination.all 
    end 


    def update
        if @post.update(posts_params) 
            if params[:post][:likes]
            @post.likes += 1 
            @post.save 
            end 
            redirect_to post_path(@post)
        else 
            flash[:errors]=@post.errors.full_messages 
            redirect_to "/posts/#{@post.id}/edit"
        end 

    end 

    def current_post
       @post= Post.find(params[:id])
    end 

   

private 
    def posts_params 
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end 
end 