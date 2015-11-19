feature 'User sign up' do

  before do
    @user = build(:user)
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up(@user) }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, Alicesmith!')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'with a password that does not match' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up(user)}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'Cannot sign up without an email' do
    user = build(:user, email: "")
    expect { sign_up(user) }.to_not change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'Cannot sign up with the same email' do
    user = build(:user, username: "alice")
    sign_up(@user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is already taken')
  end

  scenario 'Cannot sign up with the same username' do
    user = build(:user, email: "alicesmith@example.com")
    sign_up(@user)
    expect {sign_up(user)}.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username is already taken')
  end
end
