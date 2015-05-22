get '/peeps/new' do
  erb :'peeps/new'
end

post '/peeps' do
  @peep = Peep.create(message: params['message'], user_id: current_user.id)
  if @peep
    redirect to ('/')
  else
    flash[:notice] = "You didn't submit a peep"
    erb :'peeps/new'
  end
end