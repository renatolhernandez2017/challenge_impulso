module ApplicationHelper
  include Pagy::Frontend

  def show_sidebar?
    params[:controller].include?('sessions') || params[:controller].include?('public')
  end
end
