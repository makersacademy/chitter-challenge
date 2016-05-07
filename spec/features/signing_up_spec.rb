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
  end

end