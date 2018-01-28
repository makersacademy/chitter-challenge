feature 'signup' do
  scenario 'Expect user count to have increased by one' do
    expect { sign_up } .to change(User, :count). by(1)
  end

  scenario 'User not created when wrong confirmation password given' do
    expect { bad_sign_up } .not_to change(User, :count)
  end

  scenario 'Page shows intervention when User gives wrong password confirmation' do
    bad_sign_up
    expect(page).to have_content('Password and confirmation password do not match')
  end

  scenario 'page shows error when username or email is taken' do
    sign_up
    click_button 'Log out'
    sign_up
    expect(page).to have_content 'This email or username is already in use'
  end
end
