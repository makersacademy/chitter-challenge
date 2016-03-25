feature 'Password confirmation' do
  scenario 'mismatched password raises error' do

    sign_up(password_confirmation: 'bollocks')
    expect(User.all.count).to eq 0
    expect(page).to have_content('Password and confirmation password do not match')

  end
end
