require 'sinatra'


feature 'index page' do
 scenario 'shows content of posts' do
  visit('/')
  expect(page).to have_content('I am the best president OF ALL TIME!')
 end

end
