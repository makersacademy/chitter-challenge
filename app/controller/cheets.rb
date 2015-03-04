class Chitter < Sinatra::Base

  post('/cheets') do
    text = params["text"]
    Cheet.create(:text=> text, :user_id => session[:user_id], :time => Time.now)
    redirect to('/')
  end
end