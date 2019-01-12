require 'data_mapper'
require './lib/user'
require './lib/message'

task default: %w[setup]

task :setup do 
    DataMapper.setup(:default, "postgres://localhost/chitter_app_development")
    DataMapper.finalize
    puts 'setting up database'
end

task :auto_migrate => :setup do 
    DataMapper.auto_migrate!
    puts 'migrating database'
end

task :auto_upgrade => :setup do 
    DataMapper.auto_upgrade!
    puts 'migrating database'
end

task :clean do 
    rm '*.txt'
end