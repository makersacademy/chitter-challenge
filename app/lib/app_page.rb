
module AppPage

  def page(form)
    @form = form
    @posts = current_posts
    @messages = session[:messages] || []
    session[:messages] = []
    erb :index
  end
end
