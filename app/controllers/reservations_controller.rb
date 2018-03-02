class ReservationsController < ApplicationController
  before_action :current_user_must_be_reservation_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_reservation_user
    reservation = Reservation.find(params[:id])

    unless current_user == reservation.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @reservations = Reservation.page(params[:page]).per(10)

    render("reservations/index.html.erb")
  end

  def show
    @reservation = Reservation.find(params[:id])

    render("reservations/show.html.erb")
  end

  def new
    @reservation = Reservation.new

    render("reservations/new.html.erb")
  end

  def create
    @reservation = Reservation.new

    @reservation.user_id = params[:user_id]
    @reservation.listing_id = params[:listing_id]
    @reservation.status = params[:status]

    save_status = @reservation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reservations/new", "/create_reservation"
        redirect_to("/reservations")
      else
        redirect_back(:fallback_location => "/", :notice => "Reservation created successfully.")
      end
    else
      render("reservations/new.html.erb")
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])

    render("reservations/edit.html.erb")
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.listing_id = params[:listing_id]
    @reservation.status = params[:status]

    save_status = @reservation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reservations/#{@reservation.id}/edit", "/update_reservation"
        redirect_to("/reservations/#{@reservation.id}", :notice => "Reservation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Reservation updated successfully.")
      end
    else
      render("reservations/edit.html.erb")
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])

    @reservation.destroy

    if URI(request.referer).path == "/reservations/#{@reservation.id}"
      redirect_to("/", :notice => "Reservation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Reservation deleted.")
    end
  end
end
