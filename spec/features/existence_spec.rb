require 'app'

feature 'existence' do
  scenario 'homepage welcomes user to site' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
