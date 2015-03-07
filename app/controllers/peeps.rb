get '/peeps/new' do
  erb :"peeps/new"
end

post '/peeps' do
  content = params["content"]
  User.get(session[:user_id]).peeps.create(:content => content)
  redirect to('/')
end