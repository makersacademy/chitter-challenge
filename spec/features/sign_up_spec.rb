feature 'signing up to Chitter' do
  scenario 'user can sign up' do
    user_sign_up("user", "user123", 'user@user.com', 'password123', 'password123')
    visit '/peeps'
    expect(page).to have_content "Hey there, user"
  end

  scenario 'user enters a mismatching password' do
  count = User.count
  visit '/'
    user_sign_up('user', "user123", 'user@user.com', 'password123', 'password122')
    expect { user_sign_up('user', "user123", 'user@user.com', 'password123', 'password122') }.not_to change(User, :count)
  end
end
