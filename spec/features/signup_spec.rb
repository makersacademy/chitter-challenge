feature 'signup' do
  scenario 'Expect user count to have increased by one' do
    expect{ sign_up }.to change(User, :count). by(1)
  end

  scenario 'User not created when wrong confirmation password given' do
    expect{ bad_sign_up }.not_to change(User, :count)
  end

  scenario 'Page shows intervention when User gives wrong password confirmation' do
    bad_sign_up
    expect(page).to have_content('Password and confirmation password do not match')
  end
end
