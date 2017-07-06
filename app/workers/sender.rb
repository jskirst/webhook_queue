class Sender
  include Sidekiq::Worker

  sidekiq_retry_in do |_count|
    10
  end

  def perform
    @message = Message.first
    return unless @message
    status = send_request
    unless status >= 200 && status < 300
      logger.error "Failed message #{@message.id}"
      raise BadResponse
    end
    logger.info "Completed message"
    @message.destroy
  end

  def send_request
    http = Net::HTTP.start(uri.host, uri.port, use_ssl: (uri.port == 443))
    req = Net::HTTP::Post.new(uri)
    req.body = @message.content
    response = http.request(req)
    http.finish
    response.code.to_i
  end

  def uri
    URI.parse(ENV['RECEIVER_URL'])
  end

  class BadResponse < StandardError; end;
end
