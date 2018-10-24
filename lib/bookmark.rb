require 'pg'

class Tracker
  attr_reader :bm, :url_list, :htlist

  def initialize
    #@url_list = Hash.new
    @url_list = []
    @connection = PG.connect(dbname: 'bookmark_manager')
  end

  def self.instance
    @bm
  end

  def self.create
    @bm = Tracker.new
  end

  def addurl(url)
#    p "addurl(#{url}) #{@url_list.include?(url)} #{@url_list.count}"
#    @url_list[@url_list.count+1] = url if !@url_list.include?(url)
#    @url_list.push(url) if !@url_list.include?(url)
#    p @url_list

    result = @connection.exec('select count(*) from bookmarks;')
    lastcount = result[0]
    str = "insert into bookmarks (id,url) values(#{lastcount["count"].to_i + 1},'#{url}');"
    result = @connection.exec(str)
    dbfetch
    "#{url} added successfully!"
  end

 def delurl(item)
   raise 'object not found' if(@url_list.count < item.to_i)
      url = @url_list[item.to_i-1]
     @url_list.delete_at(item.to_i-1)
     dbfetch
     "#{url} deleted successfully!"
 end

  def dbfetch

    result = @connection.exec('select * from bookmarks;')
    p result
    result.map { |bookmark| bookmark['url']}

    @htlist = "<ol type=\"1\">"
    result.each do |x|
      @htlist << "<li>" + " #{x}" + "</li>"
    end
#    p @htlist
  end

end
