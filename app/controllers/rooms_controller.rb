class RoomsController < ApplicationController
    before_action :require_user

    def index
        @room = Room.new
        @rooms = Room.public_rooms
        @users = User.all_except(current_user)
    end

    def show 
    end

    def new 
    end

    def create 
        @room = Room.new(room_params)
        @room.save
        if !@room.save 
            flash[:error] = "Something is wrong"
            redirect_to rooms_path
        end
    end

    private 

    def room_params 
        params.require(:room).permit(:name)
    end
end