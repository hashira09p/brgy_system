class Admin::HomeController < AdminApplicationController
  before_action :authenticate_admin_user!
  def index
    @announcements = Announcement.all
  end
end