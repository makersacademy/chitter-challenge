feature 'New user sign up' do
  scenario 'User is directed to sign up page' do
    visit '/users/new'
    expect(page).to have_content 'Sign up below'
  end
  scenario 'User is able to sign up by submitting form' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('joe@example.com')
  end
  scenario 'Requires confirmation password to match on sign up' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
