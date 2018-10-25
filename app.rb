require 'sinatra/base'
require './lib/bookmark'

class BookMark < Sinatra::Base
  enable :sessions

  before do
    @bm = Tracker.instance
  end

  get '/' do
    @bm ||= Tracker.create()
    @bookmarks = @bm.dbfetch
    erb :landing_page
  end

  post '/refresh' do
    case params[:submit]
    when "Save"
      url_str = params[:urlitem]
      url_tag = params[:title]
      url_tag="No Title" if url_tag="" || nil
      @result1 = @bm.addurl(url_str,url_tag)
      redirect '/'
    when "Delete"
      @result = @bm.delurl(params[:deleteitem])
      params = Hash.new
      redirect '/'
    end
  end

run! if app_file == $0
end
