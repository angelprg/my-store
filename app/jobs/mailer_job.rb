class MailerJob < ApplicationJob
  queue_as :default

  def perform(article, user, update_type)
    UserMailer.with(user: user, article: article, update_type: update_type).article_update.deliver_later
  end
end
