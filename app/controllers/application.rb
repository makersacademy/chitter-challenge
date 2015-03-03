get '/' do
  @peeps = Peep.all(:order => [:time.desc])
  erb :index
end

