require 'pg'

class Tracker
  attr_reader :bm, :url_list, :htlist

  def initialize
    #@url_list = Hash.new
    @url_list = []
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

  def addurl(url)
    result = @connection.exec('select count(*) from bookmarks;')
    lastcount = result[0]
    str = "insert into bookmarks (id,url) values(#{lastcount["count"].to_i + 1},'#{url}');"
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
    @htlist = '<ul style="list-style-type:circle">'
    result = @connection.exec('select * from bookmarks;')
    result.map { |bookmark|
      @htlist << "<li>" + "id: #{bookmark["id"]} #{bookmark["url"]}" + "</li>"
    }
    @htlist
  end

end
