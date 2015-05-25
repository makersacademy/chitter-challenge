get '/peeps/new' do
  erb :'peeps/new'
end

post '/peeps' do
  text = params[:text]
  user_id = session[:user_id]
  time = Time.now
  Peep.create(text: text, time: time, user_id: user_id)
  redirect to('/')
end

get '/peeps/reply' do
  if params[:peep_id].nil?
    redirect to('/')
  else
    peep_id = params[:peep_id]
    @peep = Peep.first(id: peep_id)
    erb :'peeps/reply'
  end
end

post '/peeps/reply' do
  text = params[:text]
  time = Time.now
  user_id = session[:user_id]
  peep_id = params[:peep_id]
  Reply.create(text: text, time: time, user_id: user_id, peep_id: peep_id)
  redirect to('/')
end