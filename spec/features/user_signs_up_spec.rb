require 'user'
feature 'User signs up' do

  scenario 'when a new user is visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, nickName!')
    expect(User.first.email).to eq('test@test.com')
    expect(User.first.name).to eq('Test Test')
    expect(User.first.user_name).to eq('nickName')
    expect(User.first.password_digest).not_to eq(nil)
  end

  scenario 'with passowrds that do not match' do
    expect { sign_up('a@a.com', 'a', 'a', 'righ', 'wrong') }
      .to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Passowrds don\'t match")
  end

end