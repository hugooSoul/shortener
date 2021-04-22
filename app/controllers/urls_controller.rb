class UrlsController < ApplicationController
  #validates_presence_of :long_url
  #validates :long_url, format: URI::regexp(%w[http https])
  #validates_uniqueness_of :short_url
  #validates_length_of :long_url, within: 3..255, on: :create, message: "too long"
  #validates_length_of :short_url, within: 3..255, on: :create, message: "too long"


  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.short_url = generate_short_url
    @url.long_url = sanitize
    if @url.save
      redirect_to urls_path
    else
      flash[:error] = @url.errors.full_messages
      redirect_to new_url_path
    end
  end

  def show
    @url = Url.find_by(short_url: params[:short_url])
    redirect_to @url.sanitize
  end

  private

  def url_params
    params.require(:url).permit(:name, :long_url, :user_id, :category_id)
  end

  def generate_short_url
    rand(36**8).to_s(36)
  end

  def sanitize
    @url.long_url.strip!
    sanitize_url = @url.long_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    "http://#{sanitize_url}"
  end
end
