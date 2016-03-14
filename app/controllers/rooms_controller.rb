class RoomsController < ApplicationController
  # first display of the page. Subsequent actions (send message) will be handled in JS
  def show
    @messages = Message.all
  end
end
