# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

protected

  def configure_permitted_parameters
    added_attrs = [:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postal_code,:adresses,:telephone_number ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    public_customer_path
  end

  def after_sign_out_path_for(resource)
    public_root_path
  end

  def create_name
    self.name = "#{firstName} #{lastName}"
  end

end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end