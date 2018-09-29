require 'capybara/rspec'

feature 'add a peep' do
  scenario 'user visits their page and can add a peep' do
    visit('/')
    fill_in('compose_tweet', with: 'Hello Chitter!')
    click_button('Peep')
    expect(page).to have_content('Hello Chitter!')
  end
end