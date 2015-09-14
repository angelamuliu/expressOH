class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
    @unexpired_requests = Request.requested_within_time(1.hour)
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new()
    @request.shop_id = params[:shop_id]

    @shop = Shop.find(params[:shop_id])
    @menu = @shop.items
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    @shop = Shop.find(@request.shop)
    @menu = @shop.items
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new({:shop_id => request_params[:shop_id], :user_id => current_user.id})
    @item_ids = request_params[:item_ids].reject { |item_id| item_id.empty? }
    respond_to do |format|
      if @item_ids.length > 0 and @request.save
        @request.addItemsToRequest(request_params[:item_ids], @request.id)
        format.html { redirect_to "/", notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        if @item_ids.length < 1
            @request.errors.add(:base, "You must order at least one item")
        end
        @shop = Shop.find(@request.shop)
        @menu = @shop.items
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def browse_requests
    @shop = Shop.find(params[:shop_id])
    @requests = Request.for_shop(@shop.id).active.unclaimed.requested_within_1_hr
    # @requests = Request.for_shop(@shop.id).unclaimed
  end

  # AJAX call when the 'claim' button clicked when a person is looking through requests
  def claim
    request = Request.find(params[:id])
    deliverer = User.find(params[:deliverer_id])
    @dom_id = params[:dom_id]

    # Create delivery with current_user and request
    @delivery = Delivery.new
    @delivery.request = request
    @delivery.user = deliverer
    @delivery.save!
  end

  def deactivate
    @request = Request.find(params[:id])
    @request.active = false
    @request.save!
    redirect_to root_path, notice: 'Request has been canceled'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params[:request][:item_ids] ||= [] # If somehow nil is passed in, we convert to empty array
      params.require(:request).permit(:shop_id, :user_id, item_ids: [])
    end



end
