feature 'Passwords mismatch' do
  scenario 'Verification of password in sign up page' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  	expect(page).to have_content 'Password does not match the confirmation'
  end
end
