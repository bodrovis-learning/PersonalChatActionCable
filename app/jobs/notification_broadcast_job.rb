class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(personal_message)
    ActionCable.server.broadcast "notifications_#{personal_message.receiver.id}_channel",
                                 notification: render_notification(personal_message)
  end

  private

  def render_notification(message)
    NotificationsController.render partial: 'notifications/notification', locals: {message: message}
  end
end
