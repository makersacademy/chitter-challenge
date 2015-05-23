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

post '/peeps/makereply' do
  @original_id = params['original_id']
  erb :'peeps/reply'
end

post '/peeps/getreply' do
  @original = Peep.get(params['original_id'])
  @peep = Peep.create(message: "@#{@original.user.username}:" + params['message'], user_id: current_user.id)
  if @peep
    redirect to ('/')
  else
    flash[:notice] = "You didn't submit a peep"
    erb :'peep/reply'
  end
end