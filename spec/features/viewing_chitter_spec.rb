require './app.rb'

feature 'viewing chitter' do
  scenario 'Able to see Hello World on root' do
  visit '/'
  expect(page).to have_content('Hello world!')
  end
end