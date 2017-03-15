class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(comments_path)
  end

  def record_invalid
    flash[:alert] = "Record not found!"
    redirect_to(comments_path)
  end

  helper_method :current_user
  def current_user

  end
end
