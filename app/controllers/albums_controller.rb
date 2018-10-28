class AlbumsController < ApplicationController
  require 'rubygems'
  require 'zip'

  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]

# action method, stream the zip


    def download # silly name but you get the idea
      album = Album.find(params[:id])
      filespath = album.album_attachments.map{
        |aa| aa.picture_url
      }
      #
      puts(filespath)
      time_filename = Time.now.strftime("%Y%m%d%H%M%S").to_s << ".zip"
      zipfile_name = "#{Rails.root}/tmp/albums_download/#{time_filename}"
      puts(zipfile_name)

      Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
        filespath.each_with_index do |filepath, index|
          ext = filepath.split('.').last
          zipfile.add("image#{index+1}.#{ext}","#{Rails.root}/public#{filepath}")
        end
      end
      zip_data = File.read(zipfile_name)
      send_data(zip_data, :type => 'application/zip', :filename => zipfile_name)
    end



  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album_attachments = @album.album_attachments.all

  end

  # GET /albums/new
  def new
    @album = Album.new
    @album_attachment = @album.album_attachments.build
  end

  # GET /albums/1/edit
  def edit
    @album_attachments = @album.album_attachments.all
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        params[:album_attachments]['picture'].each do |a|
          @album_attachment = @album.album_attachments.create!(:picture => a)
        end
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, album_attachments_attributes: [:id, :album_id, :picture])
    end

    def must_be_admin
      unless current_user && current_user.admin == true
        redirect_to albums_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
      end
    end
end
