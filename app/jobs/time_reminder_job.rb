class TimeReminderJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    required_time = post.required_time
    @user = post.user
    if post.status == 'draft' && (complete_at = post.created_at + post.required_time.days) > Time.now  
      remaining_time = complete_at - Time.now
      @t = "%02d days %02d hours %02d mins " % [remaining_time/86400, remaining_time/3600%24, remaining_time/60%60]
      UserMailer.reminder(@user, @t).deliver_now
      TimeReminderJob.set(wait: 10.seconds).perform_later(post.id)
    end
  end
end
