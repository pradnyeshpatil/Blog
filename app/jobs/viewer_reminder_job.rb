class ViewerReminderJob < ApplicationJob
  queue_as :default

  def perform(post)
     UserMailer.viewer_reminder(post).deliver_now
  end
end
