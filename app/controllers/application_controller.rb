class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def brand_color_light
    "#eaf2ea"
  end
end
