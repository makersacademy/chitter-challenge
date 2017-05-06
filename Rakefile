if ENV['RACK_ENV'] != 'production'
  require 'data_mapper'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  desc 'Auto upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Operation completed successfully.'
  end

  desc 'Auto migrate'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Operation completed successfully.'
  end
end
