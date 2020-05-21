class BloggersController < ApplicationController



    def index
        @bloggers = Blogger.all
    end

    def show
        @destinations = Destination.all
        @blogger = current_blogger
        byebug
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.valid?
            @blogger.save
            redirect_to blogger_path(@blogger)
        else
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end    
    end


    def current_blogger
        @blogger = Blogger.find(params[:id])
    end

    private
    
    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end
end
