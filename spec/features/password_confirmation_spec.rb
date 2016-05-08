feature 'checks for password mismatch' do
  scenario 'verifies that password is correct on sign-up' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  	expect(page).to have_content 'Password does not match the confirmation'
  end
end
