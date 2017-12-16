feature 'Sign up' do
  scenario 'user can sign up to Chitter' do
    expect {sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, George'
    expect(User.first.email).to eq 'example@coldmail.com'
  end

  scenario 'sign up without matching passwords will fail' do
    expect {sign_up(password_confirmation: 'incorrect')}.to change(User, :count).by 0
    expect(page).to have_current_path '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
