require_relative '../../lib/app.rb'

feature 'welcome message' do
  scenario 'displays a welcome message on opening' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end

feature 'peeps' do
  scenario 'can read a posted tweet' do
    visit('/')
    expect(page).to have_content('Raefe01: This is my first post on chitter!')
  end
end
