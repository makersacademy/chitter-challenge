feature 'Signing out' do
  scenario 'a log in link is displayed in the navbar' do
    sign_out
    expect(page).to have_content('Log in')
  end
  scenario 'a sign up link is displayed in the navbar' do
    sign_out
    expect(page).to have_content('Sign up')
  end
  scenario 'redirects to the index page' do
    sign_out
    expect(current_path).to eq '/'
  end
end
