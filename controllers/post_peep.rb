class Chittter < Sinatra::Base

  post '/peeps' do
    if session[:username]
      Peep.create(content: params[:peep], time: Time.new,
                  user: session[:username])
    else
      flash[:notice] = 'you need to log in to make a peep'
    end
    redirect('/')
  end

end
