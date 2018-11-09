class Encoder
  attr_reader :raw_video

  def initialize(raw_video)
    @raw_video = raw_video
  end

  def self.encode(raw_video)
    encoder = new(raw_video)
    movie = FFMPEG::Movie.new(raw_video.path)
    new_path = encoder.encoded_path
    movie.transcode(new_path)
    encoder.remove_old_episode
  end

  def encoded_path
    @raw_video.path.chop.chop.chop + 'mp4'
  end

  def remove_old_episode
    if File.file?(@raw_video.path) && File.extname(@raw_video.path).in?(%w(.mkv .avi))
      File.delete(@raw_video.path)
    end
  end
end
