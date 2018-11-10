class Encoder

  def initialize( path, artemis_id )
    @path       = path
    @artemis_id = artemis_id
  end

  def self.encode(path)
    encoder = new(path)
    movie = FFMPEG::Movie.new(path)
    new_path = encoder.encoded_path
    movie.transcode(new_path)
    encoder.remove_old_episode
    new_path
  end

  def local_path
    short_path = @path.split ( /\/media\/pat\// )
    ENV['LOCAL_PATH'] + short_path
  end

  def encoded_path
    @path.chop.chop.chop + 'mp4'
  end

  def remove_old_episode
    if File.file?(local_path) && File.extname(local_path).in?(%w(.mkv .avi))
      File.delete(local_path)
    end
  end
end
