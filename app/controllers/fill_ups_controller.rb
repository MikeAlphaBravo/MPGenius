class FillUpsController < ApplicationController
  before_action :set_fill_up, only: [:show, :edit, :update, :destroy]
  before_action :set_vehicle, only: [:index, :new, :edit, :show]

  # GET /fill_ups
  # GET /fill_ups.json
  def index
    @fill_ups = @vehicle.fill_ups
    # if NO fillups all going to exist get rid of this.
  end

  # GET /fill_ups/1
  # GET /fill_ups/1.json
  def show
  end

  # GET /fill_ups/new
  def new
    @fill_up = FillUp.new
  end

  # GET /fill_ups/1/edit
  def edit
  end

  # POST /fill_ups
  # POST /fill_ups.json
  def create
    @fill_up = FillUp.new(fill_up_params)

    respond_to do |format|
      if @fill_up.save
        format.html { redirect_to @fill_up, notice: 'Fill up was successfully created.' }
        format.json { render :show, status: :created, location: @fill_up }
      else
        format.html { render :new }
        format.json { render json: @fill_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fill_ups/1
  # PATCH/PUT /fill_ups/1.json
  def update
    respond_to do |format|
      if @fill_up.update(fill_up_params)
        format.html { redirect_to @fill_up, notice: 'Fill up was successfully updated.' }
        format.json { render :show, status: :ok, location: @fill_up }
      else
        format.html { render :edit }
        format.json { render json: @fill_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fill_ups/1
  # DELETE /fill_ups/1.json
  def destroy
    @fill_up.destroy
    respond_to do |format|
      format.html { redirect_to fill_ups_url, notice: 'Fill up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fill_up
      @fill_up = FillUp.find(params[:id])
    end

    def set_vehicle
      @vehicle = Vehicle.find(params[:vehicle_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fill_up_params
      params.fetch(:fill_up, {})
    end
end
