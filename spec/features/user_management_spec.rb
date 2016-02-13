require_relative 'web_helpers'

feature 'Signing up' do
  include UserHelpers

  scenario 'Successful signing up with valid credentials' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq('/')
  end

  scenario 'Missing username' do
    expect { sign_up(username: '') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
  end

  scenario 'Missing email' do
    expect { sign_up(email: '') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
  end

  scenario 'Username already in use' do
    sign_up
    expect { sign_up(email: 'other@email.com') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
  end

  scenario 'Email already registered' do
    sign_up
    expect { sign_up(username: 'other') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
  end

  scenario 'Password confirmation mismatch' do
    expect { sign_up(password: 'match', password_confirmation: 'mismatch') }
      .to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
  end
end
