class GalleriesController < ApplicationController
  def index
  	@galleries = Gallery.all
  end

  def new
  	@gallery = Gallery.new
  end

  def edit
  	@gallery = Gallery.find(params[:id])
  end

  def show
  	@gallery = Gallery.find(params[:id])
  end

  def update
  end

  def create
  	@gallery = Gallery.new(params.require(:gallery).permit(:name, :image))

		if @gallery.save
			redirect_to root_path, :notice => "Your gallery item was saved"
		else
			render "new"
		end
  end

  def destroy
  	@gallery = Gallery.find(params[:id])
		@gallery.destroy
		redirect_to root_path, :notice => "Your gallery item has been deleted."
  end

end
