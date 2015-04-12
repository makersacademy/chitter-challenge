class Chittter < Sinatra::Base

  get '/reply/:id' do
    @logged_in = session[:username]
    session[:reply_id] = params[:id]
    erb :reply
  end

end
