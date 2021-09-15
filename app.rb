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
    ##sign in
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

    p "----#{user}-----"

    #session[:user_id] = user.id
    redirect('/student/home')    
    
  end

  get '/student/home' do
    ####get all the students peeps###
    @students = Student.all
    erb :students
  end 

  get '/chitter' do
    @chitters = ChitterApp.all
    "This is my chitter page"    
    erb :chitters
  end

  get '/chitter/new' do
    ## add new chitters
    erb :"chitter_new"
  end

  post '/chitter' do    
    ChitterApp.create(params[:chitter])    
    redirect '/chitter'
  end

  get '/chitter/new' do
    ## add new chitters
    p params
    erb :"chitter/new"
  end

  run! if app_file == $0
end