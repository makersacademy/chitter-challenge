require 'byebug'
feature 'User sign up' do

  scenario 'needs a valid email' do
    user_wrong_email = build(:user, email: 'invalid')
    expect {sign_up(user_wrong_email)}.not_to change(User, :count)
  end

  scenario 'needs a valid pwd' do
    user_wrong_pwd = build(:user, password: '')
    expect {sign_up(user_wrong_pwd)}.not_to change(User, :count)
  end

  scenario 'needs a confirmation password' do
    user_wrong_confirmation = build(:user, password_confirmation: 'wrong')
    expect {sign_up(user_wrong_confirmation)}.not_to change(User, :count)
  end

  scenario 'needs a username' do
    user_no_username = build(:user, username: '')
    expect {sign_up(user_no_username)}.not_to change(User, :count)
  end

  scenario 'needs a name' do
    user_no_name = build(:user, name: '')
    expect {sign_up(user_no_name)}.not_to change(User, :count)
  end

  scenario 'a new user can sign up and is added in the database' do
    factory_user = build :user
    expect { sign_up(factory_user) }.to change(User, :count).by(1)
    expect(User.first.email).to eq('john@doe.com')
    expect(User.first.name).to eq('John Doe')
    expect(User.first.username).to eq('JD03')

    expect(page).to have_content('You are logged in as JD03')
  end

end
