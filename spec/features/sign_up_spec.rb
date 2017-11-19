feature 'sign up' do
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
end
