feature 'User Sign Up' do
  scenario 'can create an account' do
    expect { user_sign_up }.to change{ User.count }.by(1)
    expect(page).to have_content('Welcome Deadpool! Chit away!')
  end

  scenario 'password must be confirmed' do
    expect { user_sign_up(password_confirmation: 'not password') }.
    not_to change{ User.count }
  end
end