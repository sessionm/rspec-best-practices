class StarsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]

  # GET /stars
  def index
    @stars = Star.all
  end

  # GET /stars/1
  def show
  end

  # GET /stars/new
  def new
    @star = Star.new
  end

  # GET /stars/1/edit
  def edit
  end

  # POST /stars
  def create
    @star = Star.new(star_params)

    if @star.save
      redirect_to @star, notice: 'Star was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stars/1
  def update
    if @star.update(star_params)
      redirect_to @star, notice: 'Star was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stars/1
  def destroy
    @star.destroy
    redirect_to stars_url, notice: 'Star was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_star
      @star = Star.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def star_params
      params.require(:star).permit(:proper_name, :slug, :composition_id, :mass, :type, :system_id)
    end
end
