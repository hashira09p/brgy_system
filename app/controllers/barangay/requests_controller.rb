class Barangay::RequestsController < ApplicationController
  before_action :set_params, only: [:create, :update]

  def index
    @request = Request.where(user: current_user)
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(set_params)
    @request.state = 'pending'
    @request.firstname = current_barangay_user.firstname
    @request.user_id = current_barangay_user.id

    if @request.save
      flash[:notice] = 'Request was successfully created.'
      redirect_to barangay_root_path
    else
      flash[:notice] = 'Request was NOT created.'
      redirect_to barangay_root_path
    end
  end

  private

  def set_params
    params.require(:request).permit(:requested_document, :document_purpose, :message)
  end
end