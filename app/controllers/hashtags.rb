get '/hashtags/:text' do
  hashtag = Hashtag.first(:text => params[:text])
  @peeps = hashtag ? hashtag.peeps : []
  erb :index
end