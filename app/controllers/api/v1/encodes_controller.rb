class Api::V1::EncodesController < ApplicationController

  def create
    EncoderJob.perform_later(params[:path])
  end
end
