require 'pathname'

source 'http://rubygems.org'

SOURCE         = ENV.fetch('SOURCE', :git).to_sym
REPO_POSTFIX   = SOURCE == :path ? ''                                : '.git'
DATAMAPPER     = SOURCE == :path ? Pathname(__FILE__).dirname.parent : 'http://github.com/datamapper'
DM_VERSION     = '~> 1.2.0'
DO_VERSION     = '~> 0.10.6'
CURRENT_BRANCH = ENV.fetch('GIT_BRANCH', 'master')

do_options = {}
do_options[:git] = "#{DATAMAPPER}/do#{REPO_POSTFIX}" if ENV['DO_GIT'] == 'true'

gem 'do_postgres',   DO_VERSION, do_options.dup
gem 'dm-do-adapter', DM_VERSION,
  SOURCE  => "#{DATAMAPPER}/dm-do-adapter#{REPO_POSTFIX}",
  :branch => CURRENT_BRANCH

group :development do

  gem 'dm-migrations', DM_VERSION,
    SOURCE  => "#{DATAMAPPER}/dm-migrations#{REPO_POSTFIX}",
    :branch => CURRENT_BRANCH

  gem 'jeweler',       '~> 1.6.4'
  gem 'rspec',         '~> 1.3.2'

end

platforms :mri_18 do
  group :quality do

    gem 'rcov',      '~> 0.9.9'
    gem 'yard',      '~> 0.6'
    gem 'yardstick', '~> 0.2'

  end
end

group :datamapper do

  gem 'dm-core', DM_VERSION,
    SOURCE  => "#{DATAMAPPER}/dm-core#{REPO_POSTFIX}",
    :branch => CURRENT_BRANCH

  gem 'data_objects', DO_VERSION, do_options.dup

  plugins = ENV['PLUGINS'] || ENV['PLUGIN']
  plugins = plugins.to_s.tr(',', ' ').split.push('dm-migrations').uniq

  plugins.each do |plugin|
    gem plugin, DM_VERSION,
      SOURCE  => "#{DATAMAPPER}/#{plugin}#{REPO_POSTFIX}",
      :branch => CURRENT_BRANCH
  end

end
