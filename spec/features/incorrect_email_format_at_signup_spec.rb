feature 'adding email address to form' do

  before do
    user_sign_up('user', "user123", 'user.com', 'password123', 'password123')
  end

  scenario 'email address must fit correct format' do
    count = User.count
    expect(current_path).to eq('/users')
    expect { user_sign_up('user', "user123", 'user.com', 'password123', 'password123') }.not_to change(User, :count)
    expect(page).to have_content('Email address has an invalid format')
  end

end
