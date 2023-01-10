class RoomsController < ApplicationController
    before_action :require_user

    def index
        @rooms = Room.public_rooms
        @users = User.all_except(current_user)
    end
end