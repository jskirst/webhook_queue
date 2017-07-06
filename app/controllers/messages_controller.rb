class MessagesController < ApplicationController
  before_action :check_request_body

  def create
    Message.create!(create_params)
    head :created
  end

  private

  def create_params
    { content: request.raw_post }
  end

  def check_request_body
    begin
      JSON.parse(request.raw_post)
    rescue
      head :bad_request
    end
  end
end
