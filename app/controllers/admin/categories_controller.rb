class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
    authorize([:admin, @categories], policy_class: Admin::CategoriesPolicy)
  end

  # GET /categories/1 or /categories/1.json
  def show
    authorize([:admin, @category], policy_class: Admin::CategoriesPolicy)
  end

  # GET /categories/new
  def new
    @category = Category.new
    authorize([:admin, @category], policy_class: Admin::CategoriesPolicy)
  end

  # GET /categories/1/edit
  def edit
    authorize([:admin, @category], policy_class: Admin::CategoriesPolicy)
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    authorize([:admin, @category], policy_class: Admin::CategoriesPolicy)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_url(@category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    authorize([:admin, @category], policy_class: Admin::CategoriesPolicy)
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_category_url(@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    authorize([:admin, @category], policy_class: Admin::CategoriesPolicy)
    
    @category.destroy

    respond_to do |format|
      format.html { redirect_to admin_categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description, :image_cover)
    end
end
