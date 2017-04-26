class BookingPicturesController < ApplicationController
  before_action :set_booking_picture, only: [:show, :edit, :update]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :show, :index]

  # GET /booking_pictures
  # GET /booking_pictures.json
  def index
    @booking_pictures = BookingPicture.all
  end

  # GET /booking_pictures/1
  # GET /booking_pictures/1.json
  def show
  end

  # GET /booking_pictures/new
  def new
    @booking_picture = BookingPicture.new
  end

  # GET /booking_pictures/1/edit
  def edit
  end

  # POST /booking_pictures
  # POST /booking_pictures.json
  def create
    @booking_post = BookingPost.find(params[:booking_post_id])
    @booking_picture = @booking_post.booking_pictures.build(booking_picture_params)

    respond_to do |format|
      if @booking_picture.save
        format.html { redirect_to :back, notice: 'Booking picture was successfully created.' }
        format.json { render :show, status: :created, location: @booking_picture }
      else
        format.html { redirect_to @booking_post, notice: 'Booking picture was not created.' }
        #format.json { render json: @booking_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_pictures/1
  # PATCH/PUT /booking_pictures/1.json
  def update
    respond_to do |format|
      if @booking_picture.update(booking_picture_params)
        format.html { redirect_to @booking_picture, notice: 'Booking picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_picture }
      else
        format.html { render :edit }
        format.json { render json: @booking_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_pictures/1
  # DELETE /booking_pictures/1.json
  def destroy
    @booking_post = BookingPost.find(params[:booking_post_id])
    @booking_picture = @booking_post.booking_pictures.find(params[:id])
    @booking_picture.photo = nil
    @booking_picture.save
    @booking_picture.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Booking picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_picture
      @booking_picture = BookingPicture.find(params[:id])
    end

    def admin_user
      redirect_to(root_url) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_picture_params
      params.require(:booking_picture).permit(:booking_post_id, :photo)
    end
end
