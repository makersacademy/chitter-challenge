post '/peeps' do
  content = params["content"]
  user = current_user.username
  Peep.create(:content => content, :user => user, :created_at => Time.now)
  redirect to '/'
end