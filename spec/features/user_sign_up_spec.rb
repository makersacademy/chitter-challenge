feature 'New user sign up' do
  scenario 'User is directed to sign up page' do
    visit '/users/new'
    expect(page).to have_content 'Sign up below'
  end
  scenario 'User is able to sign up by submitting form' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('joe@example.com')
  end
  scenario 'User is greeted by their email on sign up' do
    sign_up
    expect(page).to have_content 'Welcome, joe@example.com'
  end
end
