class Encoder

  def initialize( path, artemis_id )
    @path       = path
    @artemis_id = artemis_id
  end

  def self.encode(path, artemis_id)
    encoder = new(path, artemis_id)
    movie = FFMPEG::Movie.new(encoder.local_path)
    new_path = encoder.encoded_path
    movie.transcode(new_path)
    encoder.remove_old_episode
    encoder.update_on_complete
  end

  def local_path
    short_path = @path.split ( /\/Users\/pat\// )
    ENV['LOCAL_PATH'] + short_path.last
  end

  def update_on_complete
    ArtemisUpdater.ship_it(@artemis_id)
  end

  def encoded_path
    local_path.chop.chop.chop + 'mp4'
  end

  def remove_old_episode
    if File.file?(local_path) && File.extname(local_path).in?(%w(.mkv .avi))
      File.delete(local_path)
    end
  end
end
