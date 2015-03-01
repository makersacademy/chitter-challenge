post '/peeps' do
  content = params["content"]
  user = params["user"]
  Peep.create(:content => content, :user => user)
  redirect to '/'
end