class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
    # breaks without @url?
    # @url = url_for(@video.clip)
  end

  # GET /videos/new
  def new
    File.delete("app/assets/images/slideshow.mp4") if File.exist?("app/assets/images/slideshow.mp4")
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    @url = url_for(@video.clip)
    # routes to URL parameter at Video.rb #extract_frames
    @video.extract_frames(@url)
  end

  # POST /videos
  # POST /videos.json
  def create
    if params["video"]
      @video = Video.new(video_params)
      respond_to do |format|
        if @video.save
          # binding.pry
          format.html { redirect_to @video, notice: 'Video was successfully created.' }
          format.json { render :edit, status: :created, location: @video }
        else
          format.html { render :new }
          format.json { render json: @video.errors, status: :unprocessable_entity }
        end
      end
    else
      @video = Video.new
      render :new
    end
  end

# PATCH/PUT /videos/1
# PATCH/PUT /videos/1.json
def update
  respond_to do |format|
    if @video.update(video_params)
      format.html { redirect_to @video, notice: 'Video was successfully updated.' }
      format.json { render :show, status: :ok, location: @video }
    else
      format.html { render :edit }
      format.json { render json: @video.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /videos/1
# DELETE /videos/1.json
def destroy
  @video.destroy
  respond_to do |format|
    format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_video
  @video = Video.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def video_params
  params.require(:video).permit(:clip)
end
end
