feature 'user can sign up' do
  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content('Hello goober!')
    expect(User.first.email).to eq('john@gmail.com')
  end
end
