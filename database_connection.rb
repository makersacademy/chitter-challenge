# ENV['ENVIRONMENT'] is set in spec/spec_helper.rb
if ENV['ENVIRONMENT'] == 'test'
  DBConnection.setup('chitter_test')
else
  DBConnection.setup('chitter')
end
