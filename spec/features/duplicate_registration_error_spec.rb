feature 'Duplicate registration error --' do
  
  scenario 'User unabe to register with duplicate email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'User unable to register with duplicate username' do
    sign_up
    expect { sign_up_same_username }.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end
end
