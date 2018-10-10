class AlbumAttachmentsController < ApplicationController
  before_action :set_album_attachment, only: [:show, :edit, :update, :destroy]

  # GET /album_attachments
  # GET /album_attachments.json
  def index
    @album_attachments = AlbumAttachment.all
  end

  # GET /album_attachments/1
  # GET /album_attachments/1.json
  def show
  end

  # GET /album_attachments/new
  def new
    @album_attachment = AlbumAttachment.new
  end

  # GET /album_attachments/1/edit
  def edit
  end

  # POST /album_attachments
  # POST /album_attachments.json
  def create
    @album_attachment = AlbumAttachment.new(album_attachment_params)

    respond_to do |format|
      if @album_attachment.save
        format.html { redirect_to @album_attachment, notice: 'Album attachment was successfully created.' }
        format.json { render :show, status: :created, location: @album_attachment }
      else
        format.html { render :new }
        format.json { render json: @album_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_attachments/1
  # PATCH/PUT /album_attachments/1.json
  def update
    respond_to do |format|
      if @album_attachment.update(album_attachment_params)
        format.html { redirect_to @album_attachment.album, notice: 'Album attachment was successfully updated.' }
      end
    end
  end

  # DELETE /album_attachments/1
  # DELETE /album_attachments/1.json
  def destroy
    @album_attachment.destroy
    respond_to do |format|
      format.html { redirect_to album_attachments_url, notice: 'Album attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_attachment
      @album_attachment = AlbumAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_attachment_params
      params.require(:album_attachment).permit(:album_id, :picture)
    end
end
