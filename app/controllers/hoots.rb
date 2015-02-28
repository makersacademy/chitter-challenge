post'/hoots' do 
  username = params["username"]
  message = params["message"]

  Hoot.create(:username => username, :message => message)
  redirect to('/')
end