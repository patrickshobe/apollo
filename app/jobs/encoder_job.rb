class EncoderJob < ApplicationJob
  queue_as :default

  def perform(video)
    Encoder.encode(video)
  end
end

