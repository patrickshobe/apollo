class Encoder

  def self.encode(raw_video)
    encoder = new
    movie = FFMPEG::Movie.new(raw_video.path)
    movie.transcode(encoder.encoded_path(raw_video.path))
    encoder.remove_old_episode(raw_video)
  end

  def encoded_path(path)
    path.chop.chop.chop + 'mp4'
  end

  def remove_old_episode(episode)
    if File.file?(episode.path) && File.extname(episode.path).in?(%w(.mkv .avi))
      File.delete(episode.path)
    end
  end
end
