feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello! jessica123')
    expect(User.first.email).to eq('jessica@email.com')
  end
end
