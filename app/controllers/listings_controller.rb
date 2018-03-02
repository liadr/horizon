class ListingsController < ApplicationController
  def index
    @listings = Listing.page(params[:page]).per(10)

    render("listings/index.html.erb")
  end

  def show
    @reservation = Reservation.new
    @listing = Listing.find(params[:id])

    render("listings/show.html.erb")
  end

  def new
    @listing = Listing.new

    render("listings/new.html.erb")
  end

  def create
    @listing = Listing.new

    @listing.warehouse_id = params[:warehouse_id]
    @listing.price = params[:price]
    @listing.sqft_available = params[:sqft_available]
    @listing.start_date = params[:start_date]
    @listing.end_date = params[:end_date]
    @listing.status = params[:status]

    save_status = @listing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/listings/new", "/create_listing"
        redirect_to("/listings")
      else
        redirect_back(:fallback_location => "/", :notice => "Listing created successfully.")
      end
    else
      render("listings/new.html.erb")
    end
  end

  def edit
    @listing = Listing.find(params[:id])

    render("listings/edit.html.erb")
  end

  def update
    @listing = Listing.find(params[:id])

    @listing.warehouse_id = params[:warehouse_id]
    @listing.price = params[:price]
    @listing.sqft_available = params[:sqft_available]
    @listing.start_date = params[:start_date]
    @listing.end_date = params[:end_date]
    @listing.status = params[:status]

    save_status = @listing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/listings/#{@listing.id}/edit", "/update_listing"
        redirect_to("/listings/#{@listing.id}", :notice => "Listing updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Listing updated successfully.")
      end
    else
      render("listings/edit.html.erb")
    end
  end

  def destroy
    @listing = Listing.find(params[:id])

    @listing.destroy

    if URI(request.referer).path == "/listings/#{@listing.id}"
      redirect_to("/", :notice => "Listing deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Listing deleted.")
    end
  end
end
