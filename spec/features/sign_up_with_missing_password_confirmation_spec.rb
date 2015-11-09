feature 'Sign up with missing password' do
  scenario 'Missing password' do
    sign_up_with_missing_password_confirmation
    expect(page).to have_content 'Password does not match the confirmation'
  end
end

