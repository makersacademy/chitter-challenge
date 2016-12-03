feature 'User sign up' do
  scenario 'signing up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, George')
    epect(User.first.email).to eq('george@example.com')
  end
end
