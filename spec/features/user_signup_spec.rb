feature 'Sign Up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Chitter')
    expect(User.first.name).to eq('Tom Spencer')
  end
end
