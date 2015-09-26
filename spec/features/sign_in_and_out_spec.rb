feature 'Sign in & Sign out' do
  scenario 'I can sign in with valid information' do
    user = create(:user)
    sign_in(user)
    expect(current_path).to eq('/peeps')
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.nickname)
  end
end

def sign_in(user)
  visit '/sessions/new'
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Sign in'
end
