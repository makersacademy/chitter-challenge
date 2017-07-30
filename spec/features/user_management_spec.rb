feature 'User sign up' do

  scenario 'new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, barney@barney.com')
    expect(User.first.email).to eq 'barney@barney.com'
  end

  scenario 'matching password confirmation is required' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  
end
