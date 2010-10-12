class WidgetsController < ApplicationController
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  session :off
  
  
  # GET /widgets
  # GET /widgets.xml
  def index
    @widgets = Widget.all

    respond_to do |format|
      format.js #index.js.erb - javascript code location
      format.html # index.html.erb
      format.xml  { render :xml => @widgets }
    end
  end

  # GET /widgets/1
  # GET /widgets/1.xml
  def show
    @widget = Widget.find(params[:id])

#    code = render_to_string(:partial => 'widget',  :layout => false).delete("\n")
#    render(:text => "document.write('" + code + "');")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @widget }
    end
  end

  # GET /widgets/new
  # GET /widgets/new.xml
  def new
    @widget = Widget.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @widget }
    end
  end

  # GET /widgets/1/edit
  def edit
    @widget = Widget.find(params[:id])
  end

  # POST /widgets
  # POST /widgets.xml
  def create
#    get_rss_xml(params[:widget]['url'])
    video_data = get_rss_xml(params[:widget]['url'])
    @widget = Widget.new(params[:widget])
    video_data.each do |video|
      @widget.videos.build(video)
    end
    
    respond_to do |format|
      if @widget.save
        format.html { redirect_to(@widget, :notice => 'Widget was successfully created.') }
        format.xml  { render :xml => @widget, :status => :created, :location => @widget }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @widget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /widgets/1
  # PUT /widgets/1.xml
  def update
    @widget = Widget.find(params[:id])

    respond_to do |format|
      if @widget.update_attributes(params[:widget])
        format.html { redirect_to(@widget, :notice => 'Widget was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @widget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.xml
  def destroy
    @widget = Widget.find(params[:id])
    @widget.destroy

    respond_to do |format|
      format.html { redirect_to(widgets_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_rss_xml(url)
    video = Array.new
    doc = Nokogiri::XML(open(url + "/displayRSSFeed"))
    # this grabs the first of the elements with autostart=true
    doc.css("item").each do |node|
      video << Hash['name', node.css("media|title").text, 'url', node.css("media|group media|content")[0]['url']]
#      puts node.css("media|title").text
#      p node.css("enclosure")[0]['length'] # get length from enclosure
#      puts node.css("media|group media|content")[0]['url'] # get first url from media:content as it has autostart=true
    end
    return video
  end
end
