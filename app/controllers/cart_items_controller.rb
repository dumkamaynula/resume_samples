class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index]
  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @shop_item = ShopItem.find(params[:shop_item_id])
    @selected_item = @shop_item.cart_items.build
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    #@cart_item = CartItem.new(cart_item_params)
    @shop_item = ShopItem.find(params[:shop_item_id])
    @cart_item = @shop_item.cart_items.build(cart_item_params)
    @cart_item.shop_price = @shop_item.price

      @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
      #@cart_item.shopping_cart_id = @shopping_cart.id if @shopping_cart.present?
      if @shopping_cart.cart_confirms.any?
        @shopping_cart = ShoppingCart.create
        session[:shopping_cart_id] = @shopping_cart.id
        @cart_item.shopping_cart_id = @shopping_cart.id
      else
        @cart_item.shopping_cart_id = @shopping_cart.id if @shopping_cart.present?
      end  

    respond_to do |format|
      if @cart_item.save
        
        format.html { redirect_to @shop_item, notice: 'Cart item was successfully created.' }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { redirect_to @shop_item, notice: 'Cart item was not created.' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    @shopping_cart = @cart_item.shopping_cart if @shopping_cart.present?
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        if @shopping_cart.present?
          format.html { redirect_to @shopping_cart, notice: 'Cart item was successfully updated.' }
        else
          format.html { redirect_to :back, notice: 'Cart item was successfully updated.' }
          format.json { render :show, status: :ok, location: @cart_item }
        end
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Cart item was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end
    def admin_user
      redirect_to(shop_items_path) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.require(:cart_item).permit(:shop_item_id, :quantity, :shopping_cart_id, :shop_price)
    end
end
