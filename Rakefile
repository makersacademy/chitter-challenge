if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  task :teardown do
    connection = PG.connect(dbname: 'faldo_movie_ratings')
    connection.exec("DROP DATABASE films, comments;")
  end
end
