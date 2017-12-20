class FillUpsController < ApplicationController
  before_action :set_fill_up, only: [:show, :edit, :update, :destroy]
  before_action :set_vehicle, only: [:index, :new, :edit, :show, :create]

  # GET /fill_ups
  # GET /fill_ups.json
  def index
    @fill_ups = @vehicle.fill_ups.order(:created_at)
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
    #fill up we are creating is set to the appropriate vehicle
    previous_fill_up_mileage = @vehicle.fill_ups.last.odometer_reading
    current_fill_up_mileage = @fill_up.odometer_reading
    mileage_difference = current_fill_up_mileage - previous_fill_up_mileage
    current_mpg = mileage_difference.to_f / @fill_up.gallons_in_fill
    #round to two decimal places
    @fill_up.mpg = current_mpg
    @fill_up.vehicle = @vehicle

    if @fill_up.save
      redirect_to vehicle_fill_up_path(@vehicle, @fill_up), notice: 'Fill up was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fill_ups/1
  # PATCH/PUT /fill_ups/1.json
  def update
    if @fill_up.update(fill_up_params)
      redirect_to @fill_up, notice: 'Fill up was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fill_ups/1
  # DELETE /fill_ups/1.json
  def destroy
    if @fill_up.destroy
      redirect_to fill_ups_url, notice: 'Fill up was successfully destroyed.'
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
    params.require(:fill_up).permit(:odometer_reading, :price_per_gallon, :gallons_in_fill, :total_cost, :percent_city_highway, :notes)
  end
end
