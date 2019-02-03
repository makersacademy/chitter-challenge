class DatabaseConnection

  def self.setup(yaml_file = 'db/config.yml')
    environment = ENV['RAILS_ENV'] || 'development'
    dbconfig = YAML.load(File.read(yaml_file))
    ActiveRecord::Base.establish_connection dbconfig[environment]
  end

end
