class ContactUsController < ApplicationController
  before_action :set_contact_u, only: [:destroy]
  before_action :admin_user, only: [ :edit, :update, :destroy, :show, :index]  
  # GET /contact_us
  # GET /contact_us.json
  def index
    @contact_us = ContactU.all.paginate(:page => params[:page], :per_page => 25).order('created_at DESC')
  end

  # GET /contact_us/1
  # GET /contact_us/1.json
  def show
          @contact_u = ContactU.find(params[:id])
  end

  # GET /contact_us/new
  def new
    @contact_u = ContactU.new
  end

  # GET /contact_us/1/edit
  #def edit
  #end

  # POST /contact_us
  # POST /contact_us.json
  def create
      @email= User.where(admin: true).first.email
      @contact_u = ContactU.new(contact_u_params)

      respond_to do |format|
        if @contact_u.save
          @saved_contact_u = @contact_u
          format.html { redirect_to :back, notice: 'Your message successfully sent.' }
          ContactMailer.fresh_message(@saved_contact_u, @email).deliver_now
        else
        format.html {redirect_to :back, notice: "You missed message or email"}
        end
      end
  end

  # PATCH/PUT /contact_us/1
  # PATCH/PUT /contact_us/1.json
  #def update
  #  respond_to do |format|
  #    if @contact_u.update(contact_u_params)
  #      format.html { redirect_to @contact_u, notice: 'Contact u was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @contact_u }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @contact_u.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /contact_us/1
  # DELETE /contact_us/1.json
  def destroy
    @contact_u.destroy
    respond_to do |format|
      format.html { redirect_to contact_us_url, notice: 'Contact u was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_u
      @contact_u = ContactU.find(params[:id])
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.present? and current_user.admin?
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_u_params
      params.require(:contact_u).permit(:email, :message)
    end
end
