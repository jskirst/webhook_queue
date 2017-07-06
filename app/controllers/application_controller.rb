class ApplicationController < ActionController::API
  before_action :check_access_token

  private

  def check_access_token
    head :unauthorized unless params[:access_token] == ENV['ACCESS_TOKEN']
  end
end
