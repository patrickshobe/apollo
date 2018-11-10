require 'rails_helper'

RSpec.describe 'Video Encoder Service' do
  it 'should encode a video' do

    # Set up files for testing
    dest_folder = 'fixtures/video_files/tmp'
    dest_file_path = 'fixtures/video_files/tmp/star_trails.mkv'
    test_file_path = 'fixtures/video_files/star_trails.mkv'
    video_path = 'fixtures/video_files/tmp/star_trails.mkv'
    FileUtils.cp(test_file_path, dest_folder)
    encoded_path = 'fixtures/video_files/tmp/star_trails.mp4'

    video  = Video.new( dest_file_path )
    end_path = Encoder.encode(video)

    expect(File.file?(video_path)).to eq(false)
    expect(File.file?(encoded_path)).to eq(true)
    expect(File.extname(encoded_path)).to eq('.mp4')
    expect(end_path).to eq(encoded_path)

    # Clean Up
    File.delete(encoded_path)
  end
end
