class Encoder
  attr_reader :raw_video

  def initialize(path)
    @path = path
  end

  def self.encode(path)
    encoder = new(path)
    movie = FFMPEG::Movie.new(path)
    new_path = encoder.encoded_path
    movie.transcode(new_path)
    encoder.remove_old_episode
    new_path
  end

  def encoded_path
    @path.chop.chop.chop + 'mp4'
  end

  def remove_old_episode
    if File.file?(@path) && File.extname(@path).in?(%w(.mkv .avi))
      File.delete(@path)
    end
  end
end
