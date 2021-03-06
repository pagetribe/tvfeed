class WidgetsController < ApplicationController
  # GET /widgets
  # GET /widgets.xml
  def index
    @widgets = Widget.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @widgets }
      format.js
    end
  end

  # GET /widgets/1
  # GET /widgets/1.xml
  def show
    @widget = Widget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @widget }
      format.js
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
    @widget = Widget.new(params[:widget])

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
  
  def get_rss # Called from new.html.erb on submit
    @widget = Widget.new(:url => params[:url])
    if @widget.save
#  TODO add flash notice      
#      @widget.
#      Video.set_feed_details( params[:url], @widget.id ) 
      # set up the embed code now that we have the individual videos.
#      @widget.set_embed_code
    end
    
    redirect_to(@widget, :notice => 'Widget was successfully created.')
#    redirect_to :action => 'show', :id => @widget
#    redirect_to :action => 'index'
    #TODO sort out redirection
#    render :layout => false
#    redirect_to(widget_url)
  end
  
  # show widget partial 
  def preview_widget
    @widget = Widget.find(params[:id])
    respond_to do |format|
      format.js {render :layout=>false}
      format.html { redirect_to(@widget, :notice => 'Widget was successfully created.') }

#      format.js {render :content_type => 'text/javascript'}
    end
  end
  
end
