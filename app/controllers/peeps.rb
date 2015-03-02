post '/peeps' do
  message = params[:message]
  name = params[:name]
  username = params[:username]
  Peep.create(:message => message, :name => name, :username => username)
  redirect to ('/')
end