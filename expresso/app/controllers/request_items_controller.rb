class RequestItemsController < ApplicationController
  before_action :set_request_item, only: [:show, :edit, :update, :destroy]

  # GET /request_items
  # GET /request_items.json
  def index
    @request_items = RequestItem.all
  end

  # GET /request_items/1
  # GET /request_items/1.json
  def show
  end

  # GET /request_items/new
  def new
    @request_item = RequestItem.new
  end

  # GET /request_items/1/edit
  def edit
  end

  # POST /request_items
  # POST /request_items.json
  def create
    @request_item = RequestItem.new(request_item_params)

    respond_to do |format|
      if @request_item.save
        format.html { redirect_to @request_item, notice: 'Request item was successfully created.' }
        format.json { render :show, status: :created, location: @request_item }
      else
        format.html { render :new }
        format.json { render json: @request_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_items/1
  # PATCH/PUT /request_items/1.json
  def update
    respond_to do |format|
      if @request_item.update(request_item_params)
        format.html { redirect_to @request_item, notice: 'Request item was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_item }
      else
        format.html { render :edit }
        format.json { render json: @request_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_items/1
  # DELETE /request_items/1.json
  def destroy
    @request_item.destroy
    respond_to do |format|
      format.html { redirect_to request_items_url, notice: 'Request item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_item
      @request_item = RequestItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_item_params
      params.require(:request_item).permit(:requiest_id, :item)
    end
end
