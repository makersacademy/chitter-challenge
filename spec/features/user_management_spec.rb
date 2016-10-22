feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello joe@email.com')
    expect(User.first.email).to eq('joe@email.com')
  end
  scenario 'can not sign up with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end
  scenario "user can not sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
  scenario "user can not sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end
  scenario "I can not sign up with an email that exists" do
    sign_up
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end

feature 'User sign in' do
  let!(:user) do
    User.create(email: 'joe@eemail.com',
                password: '1234',
                password_confirmation: '1234')
  end
  scenario 'user can sign with email and password combo' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Hello #{user.email}"
  end
end
