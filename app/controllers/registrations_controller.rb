class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = t(".registration_closed")
    redirect_to root_path
  end

  def create
    flash[:info] = t(".registration_closed")
    redirect_to root_path
  end
end
