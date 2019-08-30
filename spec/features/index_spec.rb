require 'capybara'

feature 'homepage' do

  scenario 'visit homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
