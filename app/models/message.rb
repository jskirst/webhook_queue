class Message < ActiveRecord::Base
  validates :content, presence: true

  after_commit do
    Sender.perform_async
  end
end
