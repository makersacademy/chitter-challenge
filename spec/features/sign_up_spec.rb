feature 'Sign up form' do
  scenario 'User signs up correctly' do
    expect { sign_up('name', 'username', 'mail@test.test',
      '2', '2')}.to change(User, :count).by(1)
    expect(page).to have_content('username')
  end

  scenario 'User tries to sign up with a blank field' do
    expect { sign_up('', 'user', 'mail@test.test',
      '2', '2')}.to_not change(User, :count)
    expect { sign_up('name', '', 'mail@test.test',
      '2', '2')}.to_not change(User, :count)
    expect { sign_up('', 'user', '',
      '2', '2')}.to_not change(User, :count)
    expect { sign_up('', 'user', 'mail@test.test',
      '', '2')}.to_not change(User, :count)
    expect { sign_up('', 'user', 'mail@test.test',
      '2', '')}.to_not change(User, :count)
  end

  scenario 'Blank fields error messages' do
    sign_up('', '', '', '', '')
    expect(page).to have_content('Name must not be blank')
    expect(page).to have_content('Username must not be blank')
    expect(page).to have_content('Email must not be blank')
    expect(page).to have_content('Password must not be blank')
  end

  scenario 'Invalid email format error message' do
    sign_up('a', 'a', 'a', 'email@email', 'a')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'Password and confirmation mismatch message' do
    sign_up('a', 'a', 'a@a.com', 'a', 'b')
    expect(page).to have_content('Password does not match the confirmation')
  end
end
