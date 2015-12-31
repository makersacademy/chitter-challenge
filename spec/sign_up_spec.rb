
feature 'sign up' do
  scenario 'allows user to sign up for chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, joe_bloggs@gmail.com')
    expect(User.first.email).to eq('joe_bloggs@gmail.com')
  end
end
