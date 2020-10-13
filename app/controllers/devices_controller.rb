# frozen_string_literal: true

class DevicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @devices = Device.all.order(device_order: :asc)
    @photo_name = ""
    # This session is set in trigger_capture_command method.
    @photo_name = session[:photo_name] if session[:photo_name] && !session[:photo_name].empty?
    session[:photo_name] = ""
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      flash[:info] = "You have successfully created a new device: #{@device.device_name}"
      redirect_to @device
    else
      render "new"
    end
  end

  def show
    @device = Device.find(params[:id])
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])

    if @device.update(device_params)
      flash[:info] = "You have successfully updated #{@device.device_name}"
      redirect_to @device
    else
      render "edit"
    end
  end

  def destroy
    @device = Device.find(params[:id])
    if @device.destroy
      flash[:info] = "You have successfully removed #{@device.device_name}."
      redirect_to devices_path
    else
      flash[:alarm] = "Something is wrong, please contact admin or create a new issue on Github."
    end
  end

  def trigger_on_command
    trigger
  end

  def trigger_off_command
    trigger
  end

  def trigger_capture_command
    @device = Device.find(params[:id])
    cmd = @device.on_command
    system(cmd)
    session[:photo_name] = "Photo from #{@device.device_name}"
    redirect_to devices_path # camera_photo_device_path
  end

  private
    def device_params
      params.require(:device).permit(
        :device_name,
        :device_type,
        :device_location,
        :on_command,
        :off_command,
        :device_order
      )
    end

    def trigger
      @device = Device.find(params[:id])
      instruction = params[:action].split("_")[1]
      # action can be: trigger_on_command / trigger_off_command
      # cmd = case instruction
      #       when 'on'
      #         @device.on_command
      #       when 'off'
      #         @device.off_command
      #       else
      #         ''
      #       end
      if instruction != ""
        job1 = fork do
          system(@device.send("#{instruction}_command"))
        end
      end
      Process.detach(job1)
      flash[:primary] = "Turning #{@device.device_name} #{instruction}"
      redirect_to devices_path
    end
end
