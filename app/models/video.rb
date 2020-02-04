class Video < ApplicationRecord
  has_one_attached :clip
  has_one_attached :thumbnail

  def extract_frames url
    movie = FFMPEG::Movie.new(url)
    movie.screenshot("screenshot_%d.jpg", { vframes: 20, frame_rate: '1/6' }, validate: false)
  end

end
