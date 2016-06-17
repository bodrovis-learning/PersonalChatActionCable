class PersonalMessagesController < ApplicationController
  before_action :check_receiver!, only: [:new, :create]

  def new
    @personal_message = current_user.personal_messages.build
  end

  def create
    conversation = Conversation.between(current_user.id, @receiver.id)[0]
    conversation ||= Conversation.create(author_id: current_user.id,
                                         receiver_id: @receiver.id)
    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = conversation.id
    @personal_message.save!

    flash[:success] = "ok!"
    redirect_to conversation_path(conversation)
  end

  private

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end

  def check_receiver!
    @receiver = User.find_by(id: params[:receiver])
    redirect_to root_path unless @receiver
  end
end