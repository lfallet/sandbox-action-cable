class Message < ApplicationRecord
  # after DB insert, broadcast itself to clients
  after_create_commit { MessageBroadcastJob.perform_later self }
end
