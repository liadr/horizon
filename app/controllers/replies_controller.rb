class RepliesController < ApplicationController
  def index
    @replies = Reply.all

    render("replies/index.html.erb")
  end

  def show
    @reply = Reply.find(params[:id])

    render("replies/show.html.erb")
  end

  def new
    @reply = Reply.new

    render("replies/new.html.erb")
  end

  def create
    @reply = Reply.new

    @reply.body = params[:body]
    @reply.user_id = params[:user_id]
    @reply.review_id = params[:review_id]

    save_status = @reply.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/replies/new", "/create_reply"
        redirect_to("/replies")
      else
        redirect_back(:fallback_location => "/", :notice => "Reply created successfully.")
      end
    else
      render("replies/new.html.erb")
    end
  end

  def edit
    @reply = Reply.find(params[:id])

    render("replies/edit.html.erb")
  end

  def update
    @reply = Reply.find(params[:id])

    @reply.body = params[:body]
    @reply.user_id = params[:user_id]
    @reply.review_id = params[:review_id]

    save_status = @reply.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/replies/#{@reply.id}/edit", "/update_reply"
        redirect_to("/replies/#{@reply.id}", :notice => "Reply updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Reply updated successfully.")
      end
    else
      render("replies/edit.html.erb")
    end
  end

  def destroy
    @reply = Reply.find(params[:id])

    @reply.destroy

    if URI(request.referer).path == "/replies/#{@reply.id}"
      redirect_to("/", :notice => "Reply deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Reply deleted.")
    end
  end
end
