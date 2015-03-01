
post '/peeps/:content' do 
  Peep.create(
    :content => params[:content],
    :user => session[:user_id]  
  )
  redirect to('/')
end 