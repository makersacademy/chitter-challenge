feature 'passwords match' do
  scenario 'checks password is correct on sign-up' do
    expect { sign_up(password_confirmation: 'notmatching') }.not_to change(User, :count)
    expect(page).to have_content 'Password does not match the confirmation'
  end
end