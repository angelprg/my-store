class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
    authorize([:admin, @articles], policy_class: Admin::ArticlesPolicy)
  end
  
  # GET /articles/1 or /articles/1.json
  def show
    authorize([:admin, Article], policy_class: Admin::ArticlesPolicy)
  end

  # GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
    @subcategories = Subcategory.all
    authorize([:admin, @article], policy_class: Admin::ArticlesPolicy)
  end

  # GET /articles/1/edit
  def edit
    @categories = Category.all
    @subcategories = Subcategory.all
    authorize([:admin, @article], policy_class: Admin::ArticlesPolicy)
  end

  # POST /articles or /articles.json
  def create
    a_params = article_params
    a_params[:category_id] = Subcategory.find(a_params[:subcategory_id]).category_id
    @article = Article.new(a_params)
    
    authorize([:admin, @article], policy_class: Admin::ArticlesPolicy)

    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    authorize([:admin, @article], policy_class: Admin::ArticlesPolicy)

    a_params = article_params
    a_params[:category_id] = Subcategory.find(a_params[:subcategory_id]).category_id

    respond_to do |format|
      if @article.update(a_params)
        format.html { redirect_to admin_article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    authorize([:admin, @article], policy_class: Admin::ArticlesPolicy)
    
    @article.destroy

    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:name, :sku, :barcode, :slug, :description, :published, :visible, :price, :stock, :brand_id, :category_id, :subcategory_id, :image_cover, :images)
    end
end
