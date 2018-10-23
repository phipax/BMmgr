require 'sinatra/base'
require './lib/bookmark'

class BookMark < Sinatra::Base
  enable :sessions

  before do
    @bm = Tracker.instance
  end

  get '/' do
    @bm ||= Tracker.create()
    erb :landing_page
  end

  post '/refresh' do
    case params[:submit]
    when "Save"
      url_str = params[:urlitem]
#      p "refresh called #{url_str} #{@bm}"
      @result1 = @bm.addurl(url_str)
#      p "refresh called #{session[:res]}"
      redirect '/'
      #erb :landing_page
    when "Delete"
      @result = @bm.delurl(params[:deleteitem])
      params = Hash.new
      redirect '/'
      #erb :landing_page
    end
  end

run! if app_file == $0
end
