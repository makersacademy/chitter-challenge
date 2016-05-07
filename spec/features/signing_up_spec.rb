feature 'Sign up' do

  scenario 'no users should exist at the start of a test run' do
    expect(User.count).to eq 0
  end

  scenario 'creates a new user and registers them' do
    expect(User.count).to eq 0
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome Megatron'
  end

  scenario 'fails if user enters mismatched password and password confirmation fields' do
    expect {sign_up(password_confirmation: 'optimusrules')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'fails without inputting an email address' do
    sign_up(email: nil)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'fails with an invalid email address' do
    sign_up(email: 'bad_format')
    expect(current_path).to eq('/users')
    expect(page).to have_content "Email has an invalid format"
  end

  scenario 'fails with an already registered email address' do
    sign_up(username: 'OptimusPrime')
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email is already taken'
  end

    scenario 'fails with an already registered username' do
    sign_up(email: 'optimus@autobots.cyb')
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Username is already taken'
  end

end