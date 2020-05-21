class DestinationsController < ApplicationController 
    before_action :current_destination, only: [:show]

    def show 
    end 

    def current_destination 
        @destination= Destination.find(params[:id])
    end 
end 