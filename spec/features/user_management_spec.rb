feature 'User Management' do
  def sign_up(user)
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Submit'
  end

  scenario 'Sign-up page has labels for fields' do
    visit '/users/new'
    expect(page).to have_content 'Enter your email address:'
    expect(page).to have_content 'Enter your password'
  end

  scenario 'Users can sign up' do
    user = create(:user)
    expect { sign_up user }.to change(User, :count).by(1)
    expect(User.first.email).to eq(user.email)
  end
end