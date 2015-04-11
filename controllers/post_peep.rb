class Chittter < Sinatra::Base  
  post '/peeps' do
    if session[:username]
      Peep.create(content: params[:peep], time: Time.new, user: session[:username])
    end
    redirect('/')
  end
end