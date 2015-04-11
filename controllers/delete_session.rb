class Chittter < Sinatra::Base  
  delete '/sessions' do
    session[:username] = nil
    flash[:notice] = 'you have logged out successfully'
    redirect('/')
  end
end