feature 'Sign out' do
  let!(:user) do
    User.create(first_name: 'Annemarie', last_name: 'Kohler', username: 'Anne',
      email: 'anne@chittr.com', password: 'dog', password_confirmation: 'dog')
  end

  scenario 'can sign out of session' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(current_path).to eq '/'
    expect(page).to have_content('Thanks for your visit. Have a good day!')
    expect(page).not_to have_content('Welcome, Anne')
  end
end
