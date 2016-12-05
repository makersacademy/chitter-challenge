class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'/peeps/peeps'
  end

  post '/peeps/new' do
    current_user.peeps.create(message: params[:new_peep])
    if current_user.peeps.save
      flash[:notice] = "Thank you, your peep has been posted."
      redirect '/peeps'
    else
      flash[:notice] = "Your peep was not posted. Please try again."
      redirect '/peeps'
    end
  end

end
