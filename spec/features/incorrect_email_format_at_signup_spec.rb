feature 'signing up to Chitter with incorrect email format' do

  before do
    user_sign_up('user', "user123", 'user.com', 'password123', 'password123')
  end

  scenario 'user count does not increase' do
  count = User.count
    expect { user_sign_up('user', "user123", 'user.com', 'password123', 'password123') }.not_to change(User, :count)
  end

end
