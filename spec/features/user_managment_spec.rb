require './spec/features/login'
feature 'user sign up' do
  include Login
  scenario 'I can sign up as a new user' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, faisal')
    expect(User.first.email).to eq('faisal@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end

  scenario 'does not redirect when passwords dont match' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect {sign_up}.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end

  feature 'Sign in' do
    let(:user) do
      User.create(username: 'faisal',
                  email: 'faisal@gmail.com',
                  password: 'burgerking',
                  password_confirmation: 'burgerking')
    end

    scenario 'with correct credentials' do
      sign_in(email: user.email,   password: user.password)
      expect(page).to have_content "Welcome, #{user.username}"
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
    end
  end
end
