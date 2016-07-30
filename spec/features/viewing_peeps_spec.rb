require_relative 'web_helpers'

# User Story 1
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'I can sign up to Chitter' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page.current_path).to eq '/peeps'
    expect(page).to have_content "Welcome to Chitter, jonny@email.com"
    expect(User.first.email).to eq "jonny@email.com"
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
