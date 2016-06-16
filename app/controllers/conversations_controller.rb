class ConversationsController < ApplicationController
  before_action :set_conversation
  before_action :check_participating!, except: [:index]

  def index
    @conversations = Conversation.participating(current_user)
  end

  def show
    @personal_message = PersonalMessage.new
    @conversations = Conversation.participating(current_user)
  end

  def update
    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation = @conversation
    @personal_message.save!
    flash[:success] = "ok!"
    redirect_to conversation_path(@conversation)
  end

  private

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end
end