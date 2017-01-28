feature 'User sign up' do

  scenario 'A new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, dylan@bossman.com'
    expect(User.first.email).to eq 'dylan@bossman.com'
  end

end
