class App < Sinatra::Base
  get '/comment/add' do
    erb :'comment'
  end

  post '/comment/add' do
    Comment.create(content: params[:content], created_at: Time.now,
      user_id: session[:user_id], peep_id: params[:peep_id])
    redirect '/peeps'
  end
end
