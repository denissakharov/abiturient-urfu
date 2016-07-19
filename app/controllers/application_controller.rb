class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def update_monitor
    if Statement.all.empty? || Statement.maximum(:created_at) >= Time.now + 1.minute || Statement.minimum(:created_at) <= Time.now - 1.day
      redirect_to updating_path
    end
  end
end
