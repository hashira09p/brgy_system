class Barangay::HomeController < ApplicationController
  before_action :authenticate_barangay_user!
  def index
    @announcements = Announcement.order(created_at: :desc).page(params[:page]).per(2)
  end
end