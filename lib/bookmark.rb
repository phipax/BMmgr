require 'pg'

class Tracker
  attr_reader :bm, :htlist, :url

  def initialize
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.instance
    @bm
  end

  def self.create
    @bm = Tracker.new
  end

  def addurl(url,tag = "No Title")
    url = "http://" + url unless url.include?("http://") || url.include?("https://")
    str = "insert into bookmarks (title,url) values('#{tag}','#{url}');"
    result = @connection.exec(str)
    dbfetch
    "#{url} added successfully!"
  end

 def delurl(item)
  result = @connection.exec('select url from bookmarks where id='+item.to_s+";")
  url = result.map {|b| b["url"]}
  @connection.exec("delete from bookmarks where id="+item.to_s+";")
  dbfetch
 end

  def dbfetch
    @htlist = Array.new
    prep_str = ""
    result = @connection.exec('select * from bookmarks;')
    result.map { |bookmark|
       prep_str = {:ID=>bookmark['id'],:TITLE=>"#{bookmark['title']}",:URL=>"#{bookmark['url']}"}
       @htlist.push(prep_str)
    }
    @htlist
  end
end
