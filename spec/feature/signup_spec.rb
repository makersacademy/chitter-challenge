feature 'sign up form' do
  scenario 'when user signs in' do
    expect { sign_up('123@test.com', '12345', '12345') }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, Andrew')
  end

  scenario 'user fills in wrong confirmation password' do
    expect { sign_up('123@test.com', '12345', '22345') }.to_not change(User, :count)
  end

  scenario 'user fills in wrong confirmation password' do
    sign_up('123@test.com', '12345', '22345')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'user tries to sign up with an invalid email address' do
  	expect { sign_up('invalid@email', '12345', '12345') }.to_not change(User, :count)
  	expect { sign_up('invalid.com', '12345', '12345') }.to_not change(User, :count)
  end

  scenario 'user tries to sign up with existing email address' do
    sign_up('123@test.com', '12345', '12345')
    sign_up('123@test.com', '12345', '12345')
    expect(page).to have_content 'Email is already taken'
  end
end
