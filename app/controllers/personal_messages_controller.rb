class PersonalMessagesController < ApplicationController
  def new
    @personal_message = current_user.personal_messages.build
    @receivers = User.all
  end

  def create
    conversation = Conversation.find_or_create_by(author_id: current_user.id,
                                                  receiver_id: params[:receiver])
    if conversation
      @personal_message = current_user.personal_messages.build(personal_message_params)
      @personal_message.conversation = conversation
      @personal_message.save!
    end

    flash[:success] = "ok!"
    redirect_to conversation_path(conversation)
  end

  private

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end
end