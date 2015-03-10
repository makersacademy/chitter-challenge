post '/tweets' do
  message = params["message"]
  user = params["user"]
  Tweet.create(:message => message, :user => current_user.name)
  redirect to('/')
end