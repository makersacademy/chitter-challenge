feature 'User sign up' do
  scenario 'signing up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Gweaton')
    expect(User.first.email).to eq('george@example.com')
  end
  scenario 'requires a matching password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Your two passwords do not match.'
  end
end
