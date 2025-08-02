class ApartmentsController < ApplicationController
  before_action :authenticate_admin!, unless: :devise_controller?
  skip_before_action :authenticate_admin!, only: %i[index show]


  before_action :set_apartment, only: %i[ show edit update destroy ]

  # GET /apartments or /apartments.json
  def index
    @apartments = Apartment.all.order(created_at: :asc)
  end

  # GET /apartments/1 or /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments or /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.errors
    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: "Apartment was successfully created." }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    if params[:apartment][:remove_photo_ids]
      params[:apartment][:remove_photo_ids].each do |photo_id|
        photo = @apartment.photos.find_by_id(photo_id)
        photo.purge if photo
      end
    end

    if params[:apartment][:photos].blank? ||  params[:apartment][:photos].join().blank?
      params[:apartment].delete(:photos)
    end

    if params[:apartment][:photos].present?
      @apartment.photos.attach(params[:apartment][:photos])
    end

    respond_to do |format|
      if @apartment.update(apartment_params.except(:photos))
        format.html { redirect_to @apartment, notice: "Apartment was successfully updated." }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /apartments/1 or /apartments/1.json
  def destroy
    @apartment.destroy!

    respond_to do |format|
      format.html { redirect_to apartments_path, status: :see_other, notice: "Apartment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.require(:apartment).permit(:title, :description, :location, :contact_name, :contact_phone, :contact_email, photos: [])
    end
end
