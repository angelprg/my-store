class PrintJob < ApplicationJob
  queue_as :default

  def perform(user)
    p '---- Test background job ----'
    p user
    p '---- Test background job ----'
  end
end
