class WarehousesController < ApplicationController
  def index
    @q = Warehouse.ransack(params[:q])
    @warehouses = @q.result(:distinct => true).includes(:user, :city, :photos, :listings, :reviews, :favorites).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@warehouses.where.not(:address_latitude => nil)) do |warehouse, marker|
      marker.lat warehouse.address_latitude
      marker.lng warehouse.address_longitude
      marker.infowindow "<h5><a href='/warehouses/#{warehouse.id}'>#{warehouse.id}</a></h5><small>#{warehouse.address_formatted_address}</small>"
    end

    render("warehouses/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @review = Review.new
    @listing = Listing.new
    @photo = Photo.new
    @warehouse = Warehouse.find(params[:id])

    render("warehouses/show.html.erb")
  end

  def new
    @warehouse = Warehouse.new

    render("warehouses/new.html.erb")
  end

  def create
    @warehouse = Warehouse.new

    @warehouse.user_id = params[:user_id]
    @warehouse.state_id = params[:state_id]
    @warehouse.name = params[:name]
    @warehouse.sqft = params[:sqft]
    @warehouse.address = params[:address]
    @warehouse.staffed = params[:staffed]
    @warehouse.storage_methods = params[:storage_methods]
    @warehouse.total_stars = params[:total_stars]
    @warehouse.num_reviews = params[:num_reviews]

    save_status = @warehouse.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/warehouses/new", "/create_warehouse"
        redirect_to("/warehouses")
      else
        redirect_back(:fallback_location => "/", :notice => "Warehouse created successfully.")
      end
    else
      render("warehouses/new.html.erb")
    end
  end

  def edit
    @warehouse = Warehouse.find(params[:id])

    render("warehouses/edit.html.erb")
  end

  def update
    @warehouse = Warehouse.find(params[:id])

    @warehouse.user_id = params[:user_id]
    @warehouse.state_id = params[:state_id]
    @warehouse.name = params[:name]
    @warehouse.sqft = params[:sqft]
    @warehouse.address = params[:address]
    @warehouse.staffed = params[:staffed]
    @warehouse.storage_methods = params[:storage_methods]
    @warehouse.total_stars = params[:total_stars]
    @warehouse.num_reviews = params[:num_reviews]

    save_status = @warehouse.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/warehouses/#{@warehouse.id}/edit", "/update_warehouse"
        redirect_to("/warehouses/#{@warehouse.id}", :notice => "Warehouse updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Warehouse updated successfully.")
      end
    else
      render("warehouses/edit.html.erb")
    end
  end

  def destroy
    @warehouse = Warehouse.find(params[:id])

    @warehouse.destroy

    if URI(request.referer).path == "/warehouses/#{@warehouse.id}"
      redirect_to("/", :notice => "Warehouse deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Warehouse deleted.")
    end
  end
end
