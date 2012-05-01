class StorePermissionsController < ApplicationController
  def create
    user = User.where(:email_address => params[:store_permission][:email]).first
    if user.nil?
      create_new_admin_user(params[:store_permission][:email], @current_store)
      @notice = "#{params[:store_permission][:email]} has been invited to join DOSE as an administrator."
    else
      StorePermission.create(user_id: user.id, store_id: @current_store.id, permission_level: 1)
      @notice = "#{user.full_name} has been added as an administrator."

    end
    redirect_to admin_path(@current_store), notice: @notice
  end
end
