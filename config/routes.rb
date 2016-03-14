Rails.application.routes.draw do
  # main and only page
  root 'rooms#show'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
