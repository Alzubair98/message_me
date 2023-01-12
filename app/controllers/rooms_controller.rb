class RoomsController < ApplicationController
    before_action :require_user

    def index
        @rooms = Room.public_rooms
        @users = User.all_except(current_user)
        render 'index'
    end

    def show 
        @room = Room.find(params[:id])

        @rooms = Room.public_rooms
        @users = User.all_except(current_user)
        @message = Message.new
        @messages = @room.messages.order(created_at: :asc)

        render 'index'

    end

    def new 
    end

    def create 
        @room = Room.new(room_params)
        @room.save
        if !@room.save 
            flash[:error] = "Something is wrong"
            redirect_to root_path
        end
    end

    private 

    def room_params 
        params.require(:room).permit(:name)
    end
end