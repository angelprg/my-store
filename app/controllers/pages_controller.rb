class PagesController < ApplicationController

  def home
    PrintJob.set(wait: 5.seconds).perform_later 'Angel'
    authorize :pages, :home?
    @articles = Article.all
  end

end
