class Video < ApplicationRecord
  has_one_attached :clip
  validate :image_attached


  def extract_frames url
    File.delete("app/assets/images/slideshow.mp4") if File.exist?("app/assets/images/slideshow.mp4")
    puts "made it to extract_frames"
    movie = FFMPEG::Movie.new(url)
    puts "made it past movie declaration"
    duration = movie.duration
    frame_captures = (duration * 6).floor
    movie.screenshot(
      "app/assets/images/frame_%d.jpg",
      { vframes: frame_captures, frame_rate: duration },
      validate: false
    )

    # frame_num = 1;
    # frame_captures.times {
    #   img = Magick::Image.read("app/assets/images/frame_#{frame_num}.jpg").first
    #   legend = Magick::Draw.new
    #   legend.stroke = 'transparent'
    #   legend.fill = 'white'
    #   legend.gravity = Magick::SouthGravity

    #   frames = Magick::ImageList.new

    #   implosion = 0.5
    #   1.times {
    #     frames << img.implode(implosion)
    #     legend.annotate(frames, 0,0,10,20, sprintf("% 4.2f", implosion))
    #     # frames.matte = false
    #     implosion -= 2.5
    #   }

    #   frames.write("app/assets/images/frame_#{frame_num}.jpg")
    #   frame_num = frame_num + 1
    # }
    dir = 'app/assets/images'
    Dir[File.join(dir, '**', '*')].count { |file| File.file?(file) }
    
    slideshow_transcoder = FFMPEG::Transcoder.new(
      '',
      'app/assets/images/slideshow.mp4', # output
      { resolution: "640x480" },
      input: "app/assets/images/frame_%d.jpg",
      input_options: { framerate: '20' }
    )
    slideshow = slideshow_transcoder.run
  end

  private

  def image_attached
    # if clip.attached? && !clip.content_type.in?(%w(video/mov video/mp4 video/avi))
    #
    #   errors.add(:clip, "Your movie must be an MOV, MP4 or an AVI, kind person.")
    # elsif
    if
      self.clip.attached? == false
      errors.add(:clip, 'Must have a video attached.')
    end
  end
end
