module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_skipper
  end

  protected
  def check_skipper
    if current_boat_owner
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(root_path) && return
    elsif current_skipper
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(root_path) && return
    end
  end
end