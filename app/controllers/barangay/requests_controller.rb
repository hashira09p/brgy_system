class Barangay::RequestsController < ApplicationController

  def index
    @request = Request.all
  end

  def new
    @request = Request.new
  end

  def create

  end

  private

  def set_params
    params.require(:request).permit(:)
  end
end