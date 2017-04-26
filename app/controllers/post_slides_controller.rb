class PostSlidesController < ApplicationController
  before_action :set_post_slide, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :show, :index]
  # GET /post_slides
  # GET /post_slides.json
  def index
    @post_slides = PostSlide.all.order(created_at: :desc)
  end

  # GET /post_slides/1
  # GET /post_slides/1.json
  def show
  end

  # GET /post_slides/new
  def new
    @post_slide = PostSlide.new
  end

  # GET /post_slides/1/edit
  def edit
  end

  # POST /post_slides
  # POST /post_slides.json
  def create
    @post_slide = PostSlide.new(post_slide_params)

    respond_to do |format|
      if @post_slide.save
        format.html { redirect_to post_slides_path, notice: 'Post slide was successfully created.' }
        format.json { render :show, status: :created, location: @post_slide }
      else
        format.html { render :new }
        format.json { render json: @post_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_slides/1
  # PATCH/PUT /post_slides/1.json
  def update
    respond_to do |format|
      if @post_slide.update(post_slide_params)
        format.html { redirect_to @post_slide, notice: 'Post slide was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_slide }
      else
        format.html { render :edit }
        format.json { render json: @post_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_slides/1
  # DELETE /post_slides/1.json
  def destroy
    @post_slide.photo = nil
    @post_slide.save
    @post_slide.destroy
    respond_to do |format|
      format.html { redirect_to post_slides_url, notice: 'Post slide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_slide
      @post_slide = PostSlide.find(params[:id])
    end
    def admin_user
      redirect_to(root_url) unless current_user.present? and current_user.admin?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_slide_params
      params.require(:post_slide).permit(:description, :position_id, :photo, :title, :black, :title2, :description2)
    end
end
