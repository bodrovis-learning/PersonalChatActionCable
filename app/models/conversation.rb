class Conversation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  has_many :personal_messages, -> { order(position: :asc) }, dependent: :destroy

  validates :author, uniqueness: {scope: :receiver}

  scope :participating, -> (user) do
    where("(conversations.author_id = ? OR conversations.receiver_id =?)", user.id, user.id)
  end

  def participates?(user)
    author == user || receiver == user
  end

  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.author_id = ? AND conversations.receiver_id =?) OR (conversations.author_id = ? AND conversations.receiver_id =?)", sender_id, recipient_id, recipient_id, sender_id).first
  end
end
