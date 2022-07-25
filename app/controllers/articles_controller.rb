class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show ]

  def show
    authorize @article, policy_class: ArticlesPolicy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

end