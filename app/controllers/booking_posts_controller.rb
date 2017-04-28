class BookingPostsController < ApplicationController
  before_action :set_booking_post, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  # GET /booking_posts
  # GET /booking_posts.json
  def index
    @booking_posts = BookingPost.all.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /booking_posts/1
  # GET /booking_posts/1.json
  def show
    @booking_picture = @booking_post.booking_pictures.build
    @booking_pictures = @booking_post.booking_pictures
    @reservation = @booking_post.reservations.build
    @reservations = @booking_post.reservations
  end

  # GET /booking_posts/new
  def new
    @booking_post = BookingPost.new
  end

  # GET /booking_posts/1/edit
  def edit
  end

  # POST /booking_posts
  # POST /booking_posts.json
  def create
    @booking_post = BookingPost.new(booking_post_params)

    respond_to do |format|
      if @booking_post.save
        format.html { redirect_to @booking_post, notice: 'Booking post was successfully created.' }
        format.json { render :show, status: :created, location: @booking_post }
      else
        format.html { render :new }
        format.json { render json: @booking_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_posts/1
  # PATCH/PUT /booking_posts/1.json
  def update
    respond_to do |format|
      if @booking_post.update(booking_post_params)
        format.html { redirect_to @booking_post, notice: 'Booking post was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_post }
      else
        format.html { render :edit }
        format.json { render json: @booking_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_posts/1
  # DELETE /booking_posts/1.json
  def destroy
    @booking_post.destroy
    respond_to do |format|
      format.html { redirect_to booking_posts_url, notice: 'Booking post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_post
      @booking_post = BookingPost.find(params[:id])
    end

    def admin_user
      redirect_to(booking_posts_path) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_post_params
      params.require(:booking_post).permit(:title, :description, :title2, :description2)
    end
end
