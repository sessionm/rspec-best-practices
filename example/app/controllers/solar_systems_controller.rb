class SolarSystemsController < ApplicationController
  before_action :set_solar_system, only: [:show, :edit, :update, :destroy]

  # GET /solar_systems
  def index
    @solar_systems = SolarSystem.all
  end

  # GET /solar_systems/1
  def show
  end

  # GET /solar_systems/new
  def new
    @solar_system = SolarSystem.new
  end

  # GET /solar_systems/1/edit
  def edit
  end

  # POST /solar_systems
  def create
    @solar_system = SolarSystem.new(solar_system_params)

    if @solar_system.save
      redirect_to @solar_system, notice: 'Solar system was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /solar_systems/1
  def update
    if @solar_system.update(solar_system_params)
      redirect_to @solar_system, notice: 'Solar system was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /solar_systems/1
  def destroy
    @solar_system.destroy
    redirect_to solar_systems_url, notice: 'Solar system was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solar_system
      @solar_system = SolarSystem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def solar_system_params
      params.require(:solar_system).permit(:slug, :formal_name)
    end
end
