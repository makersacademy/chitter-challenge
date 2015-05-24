post '/peeps' do
  text = params[:text]
  user_id = session[:user_id]
  time = Time.now
  Peep.create(text: text, time: time, user_id: user_id)
  redirect to('/')
end

get '/peeps/reply' do
  unless params[:peep_id].nil?
    peep_id = params[:peep_id]
    @peep  = Peep.first(id: peep_id)
    erb :'peeps/reply'
  else
    redirect to('/')
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