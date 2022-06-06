class SensorsController < ApplicationController
  before_action :authenticate_user!, except: [:update_value]
  # skip_before_action :verify_authenticity_token, only: [:update_value]

  def new
    @sensor = Sensor.new
    @sensor.token = Devise.friendly_token.first(10)
  end

  def show
    @sensor = Sensor.find(params[:id])
  end

  def index
    @sensors = Sensor.all.order(created_at: :desc)
  end

  def create
    @sensor = Sensor.new(sensor_params)
    if @sensor.save
      flash[:info] = t(".success")
      redirect_to @sensor
    else
      render 'new'
    end
  end

  def edit
    @sensor = Sensor.find(params[:id])
  end

  def update
    @sensor = Sensor.find(params[:id])

    if @sensor.update(sensor_params)
      flash[:info] = t(".success")
      redirect_to @sensor
    else
      render "edit"
    end
  end

  # PATCH /sensors/1/update_value?sensor[value]=50&token=this_sensor's_token
  def update_value
    @sensor = Sensor.find(params[:id])
    if !@sensor.valid_token?(params_token: params[:token])
      render json: { 'error': 'authentication failed' }, status: :unprocessable_entity
      return
    end

    if @sensor.update(sensor_params)
      render json: { 'name': @sensor.name, 'value': @sensor.value }, status: :ok
    else
      render json: { 'error': "value: '#{sensor_params[:value]}' is unprocessable" }, status: :unprocessable_entity
    end
  end

  def destroy
    @sensor = Sensor.find(params[:id])
    if @sensor.destroy
      flash[:info] = t(".success")
      redirect_to sensors_path
    else
      flash[:alarm] = t(".failure")
    end
  end

  private
    def sensor_params
      params.require(:sensor).permit(
        :name,
        :value,
        :token,
      )
    end

    def sensor_value_params
      params.require(:sensor).permit(:value)
    end
end
