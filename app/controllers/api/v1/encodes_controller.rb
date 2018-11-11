class Api::V1::EncodesController < ApplicationController

  def create
    job_details = JSON.parse(params.keys.first, symbolize_names: true)
    EncoderJob.perform_later(job_details[:path], job_details[:id])
  end
end
