class EncoderJob < ApplicationJob
  queue_as :default

  def perform( path, artemis_id )
    Encoder.encode( path, artemis_id )
  end
end

