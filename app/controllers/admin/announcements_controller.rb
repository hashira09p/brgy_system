class Admin::AnnouncementsController < AdminApplicationController
  before_action :set_params, only: [:create, :update]
  before_action :set_announcement, only: [:update, :edit, :destroy]
  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
  end

  def show;end

  def create
    @announcement = Announcement.new(set_params)
    if @announcement.save
      flash[:notice] = 'Announcement was successfully created.'
      redirect_to home_index_path
    else
      flash[:notice] = 'Announcement was NOT created.'
      redirect_to home_index_path
    end
  end

  def edit;end

  def update
    if @announcement.update(set_params)
      flash[:notice] = 'Announcement was successfully updated.'
      redirect_to home_index_path
    else
      flash[:alert] = 'Announcement was failed to update.'
      redirect_to edit_announcement_path
    end
  end

  def destroy
    if @announcement.destroy
      flash[:notice] = 'Announcement was successfully destroyed.'
      redirect_to home_index_path
    else
      flash[:alert] = 'Announcement was failed to destroyed.'
      redirect_to home_index_path
    end
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def set_params
    params.require(:announcement).permit(:title, :description)
  end
end