class AlbumController < ApplicationController

  def new
    @album = Album.new
    render :new
  end
  def show
    @album = Album.find(params[:id])
    render :show
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_url
  end

  def updated
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to bands_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  private
  def album_params
    params.require(:album).permit(:band_id,:name,:live,:year)
  end


end
