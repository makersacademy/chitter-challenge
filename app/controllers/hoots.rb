post'/hoots' do 
  name = current_user.name
  username = current_user.username
  message = params["message"]

  Hoot.create(:name => name, :username => username, :message => message)
  redirect to('/')
end