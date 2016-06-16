class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  acts_as_list scope: :conversation

  validates :body, presence: true

  after_create_commit { NotificationBroadcastJob.perform_later(self) }

  def receiver
    if conversation.author == conversation.receiver || conversation.receiver == user
      conversation.author
    else
      conversation.receiver
    end
  end
end
