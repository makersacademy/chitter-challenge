
feature 'Password confirmation' do

  scenario 'a user can\'t sign up with mismatched passwords' do

    sign_up(password: 'password', password_confirmation: 'posword')
    expect(page).to have_current_path('/users')
    expect(page).to have_content('Password does not match the confirmation')

  end

end
