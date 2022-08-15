require 'pg'
feature 'homepage' do
  scenario 'shows the title Chitter' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end