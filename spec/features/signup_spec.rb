# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign in' do

  scenario 'user can sign up for Chitter' do
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign up')

  end
end
