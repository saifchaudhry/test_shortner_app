class UrlsController < ApplicationController
  def index
  end

  def create
    url = Url.find_or_create_by(actual_url: url_params[:actual_url])
    if url.valid?
      url.update(shortened_url: UrlShortner.bijective_encode(url.id)) unless url.shortened_url
      redirect_to url
    else
      flash[:error] = 'Url you added is incorrect. Please try adding a correct one'
      redirect_to root_path
    end
  end

  def new
    @url = Url.new
  end

  def show
    @url = Url.find(params[:id])
  end

  def decode
    @url = Url.find_by_id(UrlShortner.bijective_decode(params[:shortened_url]))
    @url.increment!(:views)
    redirect_to @url.actual_url
  end

  def url_params
    params.require(:url).permit(:actual_url)
  end
end
