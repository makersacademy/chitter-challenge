post '/peeps' do
  message = params["message"]
  user = params["user"]
  hashtags = params["hashtags"].split(" ").map{|hashtag| Hashtag.first_or_create(:text => hashtag)}
  Peep.create(:message => message,:maker_id => session[:maker_id], :hashtags => hashtags)
  redirect to('/')
end