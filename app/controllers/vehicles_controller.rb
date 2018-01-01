class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = current_user.vehicles
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = current_user.vehicles.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      assign_vehicle_to_user
      redirect_to @vehicle, notice: 'Vehicle was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: 'Vehicle was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    if @vehicle.destroy
      redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = current_user.vehicles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:nickname, :year, :make, :model)
        # , :odometer, :image)
        # , :trim
        #anything that comes from the actual form
    end

    def assign_vehicle_to_user
      Account.create(
        user_id: current_user.id,
        vehicle_id: @vehicle.id
      )
      #need to research how to properly integrate this into a :through, this is the hacky version, if I were to delete a vehicle now the account record still exists in the database.
    end
end
