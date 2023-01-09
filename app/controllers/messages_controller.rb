class MessagesController < ApplicationController 
    before_action :require_user
    before_action :set_message, only: [:destroy]
    before_action :require_same_user, only: [:destroy]

    def create
        message = current_user.messages.build(message_params)
        if message.save 
            ActionCable.server.broadcast "chatroom_channel", { body: message_render(message) }
        end
    end

    def destroy
        @message.destroy
        redirect_to root_path
    end

    private

    def set_message 
        @message = Message.find(params[:id])
    end

    def require_same_user 
        if current_user != @message.user
            flash[:error] = "You can only delete your own messages"
            redirect_to root_path
        end
    end

    def message_params 
        params.require(:message).permit(:body)
    end

    def message_render(message)
        render(partial: 'message', locals: {message: message})
    end
end