class ShopItemsController < ApplicationController
  before_action :set_shop_item, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  # GET /shop_items
  # GET /shop_items.json
  def index
    if params[:search].present?
      @shop_items = ShopItem.search_for_items(params[:search]).paginate(:page => params[:page], :per_page => 32).order('created_at DESC')
    else
      @shop_items = ShopItem.all.paginate(:page => params[:page], :per_page => 32).order('created_at DESC')
    end
  end

  # GET /shop_items/1
  # GET /shop_items/1.json
  def show
    @cart_item = @shop_item.cart_items.build
    @cart_items = @shop_item.cart_items
  end

  # GET /shop_items/new
  def new
    @shop_item = ShopItem.new
  end

  # GET /shop_items/1/edit
  def edit
  end

  # POST /shop_items
  # POST /shop_items.json
  def create
    @shop_item = ShopItem.new(shop_item_params)

    respond_to do |format|
      if @shop_item.save
        format.html { redirect_to shop_items_path, notice: 'Shop item was successfully created.' }
        format.json { render :show, status: :created, location: @shop_item }
      else
        format.html { render :new }
        format.json { render json: @shop_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_items/1
  # PATCH/PUT /shop_items/1.json
  def update
    respond_to do |format|
      if @shop_item.update(shop_item_params)
        format.html { redirect_to @shop_item, notice: 'Shop item was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop_item }
      else
        format.html { render :edit }
        format.json { render json: @shop_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_items/1
  # DELETE /shop_items/1.json
  def destroy
    @shop_item.shop_image = nil
    @shop_item.save
    @shop_item.destroy
    respond_to do |format|
      format.html { redirect_to shop_items_url, notice: 'Shop item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_item
      @shop_item = ShopItem.find(params[:id])
    end
    def admin_user
      redirect_to(shop_items_path) unless current_user.present? and current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_item_params
      params.require(:shop_item).permit(:title1, :title2, :description1, :description2, :price, :shop_image, :search)
    end
end
