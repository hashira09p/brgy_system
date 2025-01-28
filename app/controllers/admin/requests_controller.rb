class Admin::RequestsController < AdminApplicationController
  before_action :set_request, only: [:process]
  def index
    @requests = Request.all
  end

  def process
    if @request.may_complete?
      @request.process!
      flash[:notice] = 'Success'
      redirect_to requests_path
    else
      flash[:alert] = @request.errors.full_messages.to_sentence
      redirect_to requests_path
    end
  end

  private

  def set_request
    @request = Request.find(params[:id] || params[:request_id])
  end
end