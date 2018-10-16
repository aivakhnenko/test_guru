class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('.welcome_message', name: current_user.full_name)
  end
end
