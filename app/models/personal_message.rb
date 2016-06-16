class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  acts_as_list scope: :conversation

  validates :body, presence: true
end
