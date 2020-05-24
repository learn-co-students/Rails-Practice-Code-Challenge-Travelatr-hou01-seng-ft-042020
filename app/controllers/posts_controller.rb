class PostsController < ApplicationController
  before_action :current_post, only: [:show, :edit, :update]

  def new
    @post = Post.new
    @destinations = Destination.all
    @bloggers = Blogger.all
  end

  def create
    post = Post.new(post_params)
    if post.valid?
      post.save
      redirect_to post_path(post)
    else
      flash[:errors] = post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_path
    end
  end

  def like
    @post = Post.find(params[:id])
    byebug
    @post.add_like
    @post.save
    redirect_to post_path(@post)
  end

  def show
  end

  private

  def current_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end

