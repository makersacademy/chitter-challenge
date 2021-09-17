require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/makers_students'
require './lib/chitter'

class ChitterMessage < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get '/' do
    ##login or sign up
    erb :index
  end

  get '/students' do
    ## need a html button for descending order
    @students = Student.all
    erb :students
  end

  get '/students/new' do
    erb :students_new
  end

  post '/students/new' do
    ##request new student   
    p "----#{params}-----"

    user = Student.create(
      email: params[:email],
      password: params[:password],
      student_name: params[:student_name],
      username: params[:username]
    )

    session[:user_id] = user[0].to_i
    session[:username] = params[:username]


    redirect('/student/home')
  end

  get '/student/home' do
    ####get all the students peeps and make a dashboard###
    @username = session[:username]
    @peeps = ChitterApp.all
    erb :student_home
  end 

  get '/chitter/new' do
    @username = session[:username]    
    erb :"chitter_new"
  end

  post '/chitter' do    
    @username = session[:username]
    user_id = session[:user_id]
    ChitterApp.create(user_id, params[:chitter])    
    redirect '/student/home'
  end

  run! if app_file == $0
end