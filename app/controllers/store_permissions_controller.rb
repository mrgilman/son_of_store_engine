class StorePermissionsController < ApplicationController
  def create
    raise params.inspect
    redirect_to root_path
  end
end