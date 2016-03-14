class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'RoomChannel', message: render_message(message)
  end

  private
    def render_message(msg)
      # new in Rails 5: the renderer has been extracted from the controller instance itself
      ApplicationController.renderer.render(partial: 'messages/message', locals: {message: msg})
    end
end
