class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit, :update, :destroy]

  # GET /planets
  def index
    @planets = Planet.all
  end

  # GET /planets/1
  def show
  end

  # GET /planets/new
  def new
    @planet = Planet.new
  end

  # GET /planets/1/edit
  def edit
  end

  # POST /planets
  def create
    @planet = Planet.new(planet_params)

    if @planet.save
      redirect_to @planet, notice: 'Planet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /planets/1
  def update
    if @planet.update(planet_params)
      redirect_to @planet, notice: 'Planet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /planets/1
  def destroy
    @planet.destroy
    redirect_to planets_url, notice: 'Planet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planet
      @planet = Planet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def planet_params
      params.require(:planet).permit(:proper_name, :slug, :system_id)
    end
end
