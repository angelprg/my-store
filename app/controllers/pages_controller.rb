class PagesController < ApplicationController

  def home
    authorize :pages, :home?
    @articles = Article.all
  end

end
