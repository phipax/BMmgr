class Tracker
  attr_reader :bm, :url_list, :htlist

  def initialize
    #@url_list = Hash.new
    @url_list = []
  end

  def self.instance
    @bm
  end

  def self.create
    @bm = Tracker.new
  end

  def addurl(url)
#     p "addurl(#{url}) #{@url_list.include?(url)} #{@url_list.count}"
#      @url_list[@url_list.count+1] = url if !@url_list.include?(url)
       @url_list.push(url) if !@url_list.include?(url)
       p @url_list
      formatter
#      p @url_list
    "#{url} added successfully!"
  end

 def delurl(item)
   raise 'object not found' if(@url_list.count < item.to_i)
      url = @url_list[item.to_i-1]
     @url_list.delete_at(item.to_i-1)
     formatter
     "#{url} deleted successfully!"
 end

  def formatter
    @htlist = "<ol type=\"1\">"
    @url_list.each do |x|
      @htlist << "<li>" + " #{x}" + "</li>"
    end
    p @htlist
  end

end
