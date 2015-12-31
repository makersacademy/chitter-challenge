# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'Signing out' do
  before do
    sign_in
  end
  scenario 'a log in link is displayed in the navbar' do
    sign_out
    expect(page).to have_content('Log in')
  end
  scenario 'a sign up link is displayed in the navbar' do
    sign_out
    expect(page).to have_content('Sign up')
  end
  scenario 'redirects to the index page with a goodbye message' do
    sign_out
    msg = 'Giamir Buoncristiani, you logged out successfully'
    expect(page).to have_content msg
    expect(current_path).to eq '/'
  end
end
