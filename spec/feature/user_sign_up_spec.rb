feature 'User sign up' do

  scenario 'Sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_css('#message', visible: false, text: 'Email must not be blank')
  end

  scenario 'Sign up with an invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_css('#message', visible: false, text: 'Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_css('#message', visible: false, text: 'Email is already taken')
  end

  scenario 'Requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_css('#message', visible: false, text: 'Password does not match the confirmation')
  end

  scenario 'Sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Test Person')
    expect(User.first.email).to eq('peep1@peeps.com')
  end
end
