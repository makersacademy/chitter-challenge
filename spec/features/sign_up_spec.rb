feature 'User sign up' do

let(:user) do
  build(:user)
end


  scenario 'I can sign up as a new user' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, #{user.full_name}")
    expect(User.first.full_name).to eq("#{user.full_name}")
  end

  scenario 'with a password that does not match' do
    user = build(:user, password_confirmation: "wrong")
    sign_up(user)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end

  scenario 'with an email that is already registered' do
    sign_up(user)
    user_two = build(:user, username: "monkey")
    expect { sign_up(user_two)}.to change(User, :count).by(0)
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end

  scenario 'with a username that is already registered' do
    sign_up(user)
    user_two = build(:user, email: "other@fakemail.com")
    expect { sign_up(user_two)}.to change(User, :count).by(0)
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end

end
