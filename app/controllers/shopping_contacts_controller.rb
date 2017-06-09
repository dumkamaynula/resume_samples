class ShoppingContactsController < ApplicationController
  before_action :set_shopping_contact, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index]
  # GET /shopping_contacts
  # GET /shopping_contacts.json
  def index
    @shopping_contacts = ShoppingContact.all
  end

  # GET /shopping_contacts/1
  # GET /shopping_contacts/1.json
  def show
  end

  # GET /shopping_contacts/new
  def new
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @shopping_contact = @shopping_cart.shopping_contacts.build unless @current_contact.present?
  end

  # GET /shopping_contacts/1/edit
  def edit
  end

  # POST /shopping_contacts
  # POST /shopping_contacts.json
  def create
    
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @shopping_contact = @shopping_cart.shopping_contacts.build(shopping_contact_params)
    if @shopping_cart.user_id.present?
      @shopping_contact.user_id = @shopping_cart.user_id
    end
    #@shopping_contact = ShoppingContact.new(shopping_contact_params)

    respond_to do |format|
      if @shopping_contact.save
        format.html { redirect_to @shopping_cart, notice: 'Shopping contact was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_contact }
      else
        format.html { redirect_to @shopping_cart, notice: 'All fields must be completed.' }
        format.json { render json: @shopping_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_contacts/1
  # PATCH/PUT /shopping_contacts/1.json
  def update
    respond_to do |format|
      if @shopping_contact.update(shopping_contact_params)
        if @shopping_contact.shopping_cart.present?
          format.html { redirect_to @shopping_contact.shopping_cart, notice: 'Shopping contact was successfully updated.' }
          format.json { render :show, status: :ok, location: @shopping_contact }
        else
          format.html { redirect_to @shopping_contact, notice: 'Shopping contact was successfully updated.' }
          format.json { render :show, status: :ok, location: @shopping_contact }
        end
      else
        format.html { render :edit }
        format.json { render json: @shopping_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_contacts/1
  # DELETE /shopping_contacts/1.json
  def destroy
    @shopping_contact.destroy
    respond_to do |format|
      format.html { redirect_to shopping_contacts_url, notice: 'Shopping contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_contact
      @shopping_contact = ShoppingContact.find(params[:id])
    end
    def admin_user
      redirect_to(shop_items_path) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_contact_params
      params.require(:shopping_contact).permit(:shopping_cart_id, :user_id, :state, :city, :zip_code, :adress, :email, :phone, :full_name)
    end
end
