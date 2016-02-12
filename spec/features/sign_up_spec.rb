feature 'sign_up' do
  scenario 'user can sign up for Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, example26!')
    expect(User.first.email).to eq('example@example.com')
  end
end
