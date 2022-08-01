class Admin::SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: %i[ show edit update destroy ]

  # GET /subcategories or /subcategories.json
  def index
    @subcategories = Subcategory.all
    authorize([:admin, @subcategories], policy_class: Admin::SubcategoriesPolicy)
  end

  # GET /subcategories/1 or /subcategories/1.json
  def show
    authorize([:admin, @subcategory], policy_class: Admin::SubcategoriesPolicy)
  end

  # GET /subcategories/new
  def new
    @subcategory = Subcategory.new
    authorize([:admin, @subcategory], policy_class: Admin::SubcategoriesPolicy)
  end

  # GET /subcategories/1/edit
  def edit
    authorize([:admin, @subcategory], policy_class: Admin::SubcategoriesPolicy)
  end

  # POST /subcategories or /subcategories.json
  def create
    @subcategory = Subcategory.new(subcategory_params)
    authorize([:admin, @subcategory], policy_class: Admin::SubcategoriesPolicy)

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to admin_subcategory_url(@subcategory), notice: "Subcategory was successfully created." }
        format.json { render :show, status: :created, location: @subcategory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcategories/1 or /subcategories/1.json
  def update
    authorize([:admin, @subcategory], policy_class: Admin::SubcategoriesPolicy)

    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to admin_subcategory_url(@subcategory), notice: "Subcategory was successfully updated." }
        format.json { render :show, status: :ok, location: @subcategory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1 or /subcategories/1.json
  def destroy
    authorize([:admin, @subcategory], policy_class: Admin::SubcategoriesPolicy)
    
    @subcategory.destroy

    respond_to do |format|
      format.html { redirect_to admin_subcategories_url, notice: "Subcategory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subcategory_params
      params.require(:subcategory).permit(:name, :description, :image_cover, :category_id)
    end
end
