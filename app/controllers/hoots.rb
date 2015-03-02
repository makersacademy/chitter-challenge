post'/hoots' do 
  name = current_user.name
  username = current_user.username
  message = params["message"]
  datetime = Time.now

  Hoot.create(:name => name, :username => username, :message => message, :created_at => datetime.strftime("%d/%m/%Y %H:%M:%S"))
  redirect to('/')
end