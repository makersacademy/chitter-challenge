class DatabaseConnection

  def self.setup
    @environment = ENV['RAILS_ENV'] || 'development'
    @dbconfig = YAML.load(File.read('db/config.yml'))
    @db_connection = ActiveRecord::Base.establish_connection @dbconfig[@environment]
  end

end
