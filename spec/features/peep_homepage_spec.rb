require 'pg'

feature 'homepage for chitter' do
  scenario 'user can view peeps' do
    visit('/')
    expect(page).to have_content 'Oh hey chitter!'
  end
end
