class Admin::ShowsController < Admin::BaseController

  layout "administration"
  cache_sweeper :blog_sweeper

  def index
    @shows = Show.page(params[:page]).per(this_blog.admin_display_elements)
  end

  def new
    @show = Show.new(params[:id])
    @show.text_filter ||= current_user.text_filter
    if request.post?
      if @show.save
        flash[:notice] = _('Show was successfully created.')
        redirect_to :action => 'index'
      end
    end
  end

  def edit
    @show = Show.find(params[:id])
    if request.post? and @show.save
      flash[:notice] = _('Show was successfully updated.')
      redirect_to :action => 'index'
    end
  end

  def destroy
    @record = Show.find(params[:id])
    return(render 'admin/shared/destroy') unless request.post?
    @record.destroy
    redirect_to :action => 'index'    
  end

  def promote
    @show = Show.find(params[:id])
  end

  def create_fb_event
    @show = Show.find(params[:id])
    @social = Social.find_by_provider('facebook')
    @user_graph = Koala::Facebook::API.new(@social.token)
    page_token = @user_graph.get_page_access_token('405635866159693')
    @page_graph = Koala::Facebook::API.new(page_token)
    #picture = Koala::UploadableIO.new(File.open("PATH TO YOUR EVENT IMAGE"))

    title = "Skyfoot"
    unless @show.cobill1.blank?
      title << "w/ " + @show.cobill1
    end

    unless @show.cobill2.blank?
      unless @show.cobill3.blank?
        title << ", " + @show.cobill2 + " and " + @show.cobill3
      else
        title << " and " + @show.cobill2
      end
    end
    
    title << " @ " + @show.venue

    unless @show.event.blank?
      title << " " + @show.event
    end

    params = {
      #:picture => picture
      :name => title,
      :description => 'description',
      :start_time => @show.start.to_time.in_time_zone('EST').iso8601,
      :end_time => @show.endtime.to_time.in_time_zone('EST').iso8601
    }
    
    event_id = @page_graph.put_object('me','events', params)
    flash[:notice] = params.to_s

  end


  private
end
