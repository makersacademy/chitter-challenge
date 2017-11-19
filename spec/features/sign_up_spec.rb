feature 'Error messages' do
  scenario 'Invalid email format error message' do
    sign_up('name', 'user', 'mailtest.com', 'pass', 'pass')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'Confirmation does not patch password' do
    sign_up('name', 'user', 'email@email.com', 'pass', 'not_pass')
    expect(page).to have_content('Password does not match the confirmation')
  end
end

feature 'Sign up form' do
  scenario 'must have name' do
    expect { sign_up('', 'user', 'email@email.com',
        'pass', 'pass')}.to_not change(User, :count)
  end

  scenario 'must have username' do
    expect { sign_up('name', '', 'email@email.com',
        'pass', 'pass')}.to_not change(User, :count)
    end

  scenario 'must have email'  do
    expect { sign_up('name', 'user', '',
            'pass', 'pass')}.to_not change(User, :count)
    end

  scenario 'must have password' do
    expect { sign_up('', 'user', 'email@email.com',
      '', 'pass')}.to_not change(User, :count)
    end

  scenario 'must have password confirmation' do
    expect { sign_up('', 'user', 'email@email.com',
      'pass', '')}.to_not change(User, :count)
    end
end
