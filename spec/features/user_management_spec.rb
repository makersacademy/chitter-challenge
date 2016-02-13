feature 'User sign up' do

  scenario 'requires a matching confirmation password' do
    expect {sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'bingo@mail.com', password: 'abcd123', password_confirmation: '231321')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end
end

