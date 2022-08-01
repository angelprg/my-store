class Admin::BrandsController < ApplicationController
  before_action :set_brand, only: %i[ show edit update destroy ]

  # GET /brands or /brands.json
  def index
    @brands = Brand.all
    authorize([:admin, @brands], policy_class: Admin::BrandsPolicy)
  end

  # GET /brands/1 or /brands/1.json
  def show
    authorize([:admin, Brand], policy_class: Admin::BrandsPolicy)
  end

  # GET /brands/new
  def new
    @brand = Brand.new
    authorize([:admin, @brand], policy_class: Admin::BrandsPolicy)
  end

  # GET /brands/1/edit
  def edit
    authorize([:admin, @brand], policy_class: Admin::BrandsPolicy)
  end

  # POST /brands or /brands.json
  def create
    @brand = Brand.new(brand_params)
    authorize([:admin, @brand], policy_class: Admin::BrandsPolicy)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to admin_brand_url(@brand), notice: "Brand was successfully created." }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1 or /brands/1.json
  def update
    authorize([:admin, @brand], policy_class: Admin::BrandsPolicy)
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to admin_brand_url(@brand), notice: "Brand was successfully updated." }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1 or /brands/1.json
  def destroy
    authorize([:admin, @brand], policy_class: Admin::BrandsPolicy)
    
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to admin_brands_url, notice: "Brand was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brand_params
      params.require(:brand).permit(:name, :description, :image_cover)
    end
end
