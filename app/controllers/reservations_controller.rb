class ReservationsController < ApplicationController
  #before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :destroy, :show, :index] 
  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @booking_post = BookingPost.find(params[:booking_post_id])
    @email= User.where(admin: true).first.email
    @reservation = @booking_post.reservations.build(reservation_params)
    
    respond_to do |format|
      if @reservation.save
        @saved_reservation = @reservation
        format.html { redirect_to :back, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
        ReservationMailer.fresh_message(@saved_reservation, @email).deliver_now
      else
        format.html {redirect_to :back
        flash[:info] = @reservation.errors.full_messages do |m|
          m
        end}
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_path, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    #@booking_post = BookingPost.find(params[:booking_post_id])
    #@reservation = @booking_post.reservations.find(params[:id])
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def admin_user
      redirect_to(root_url) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:booking_post_id, :email, :phone_number, :name, :start, :end)
    end
end
