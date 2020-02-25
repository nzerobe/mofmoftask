class PropertiesController < ApplicationController
  before_action :set_property, only: %i(show edit update destroy)

  def new
    @property = Property.new
    @property.stations.build
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      redirect_to new_property_path
    end
  end

  def index
    @properties = Property.all
  end

  def edit
    @property.stations.build
  end

  def update
    if @property.update(update_property_params)
      redirect_to properties_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :notes, stations_attributes: %i(line_name station_name walk_minutes))
  end

  def update_property_params
    params.require(:property).permit(:name, :rent, :address, :age, :notes, stations_attributes: [:line_name, :station_name, :walk_minutes, :_destroy, :id])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end