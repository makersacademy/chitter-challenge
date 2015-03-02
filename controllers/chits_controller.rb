post '/chits' do
  username = params["username"]
  text = params["text"]
  Chit.create(:username => username, :text => text)
  redirect to('/')
end