require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task :default do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = '**{,/*/**}/*_spec.rb'
  end
  Rake::Task["spec"].execute
  
  RuboCop::RakeTask.new(:rubocop) do |t|
    t.options = ['--auto-correct']
  end
  Rake::Task["rubocop"].execute
end
