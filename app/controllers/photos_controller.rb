class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })
    @the_photo = matching_photos.at(0)
    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show.html.erb" })
    end
  end

  def baii
    url_id = params.fetch("toast_id")
    matching_photos = Photo.where({ :id => url_id })
    the_photo = matching_photos.at(0)
    if the_photo == nil
      redirect_to("/404")
    else
      the_photo.destroy
      #render({ :template => "photo_templates/baii.html.erb" })
      redirect_to("/photos")
    end
  end
end
