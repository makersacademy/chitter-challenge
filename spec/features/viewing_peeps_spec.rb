require_relative 'web_helpers'

# User Story 1
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'I can sign up to Chitter' do
    sign_up
  end
end



feature 'Viewing peeps' do
  scenario 'I can view all peeps on a peeps page' do
    Peep.create(peep: 'Pogba to United?')
    visit '/peeps'
    # expect(page.current_path).to eq '/peeps'
    expect(page).to have_content 'Pogba to United?'
  end
end
