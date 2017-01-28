feature 'users can be created' do
  scenario 'user fills out fields correctly' do
    sign_up

    expect(User.first.full_name).to eq 'Donald J. Trump'
    expect(User.first.user_name).to eq 'realDonaldTrump'
    expect(User.first.email).to     eq 'scumlord@potus.com'

    expect(current_path).to eq '/'
    expect(page).to have_content '@realDonaldTrump'
  end

  context 'user sign up invalid' do
    scenario 'bad password_confirmation' do
      sign_up(password_confirmation: 'not correct')
      expect(User.first).to be_nil
      expect(current_path).to eq '/user'
      expect(page).to have_content 'Password does not match the confirmation'
    end

    scenario 'bad email' do
      sign_up(email: 'not correct')
      expect(User.first).to be_nil
      expect(current_path).to eq '/user'
      expect(page).to have_content 'Email has an invalid format'
    end
    xscenario 'empty passwords'
    scenario 'empty fields' do
      sign_up(full_name: '')
      expect(page).to have_content 'Full name must not be blank'
      sign_up(user_name: '')
      expect(page).to have_content 'User name must not be blank'
      sign_up(email: '')
      expect(page).to have_content 'Email must not be blank'
    end

    scenario 'dupliclated email/username' do
      sign_up
      log_out
      sign_up(user_name: 'bob')
      expect(page).to have_content 'Email is already taken'

      sign_up(email: 'stuff@stuff.com')
      expect(page).to have_content 'User name is already taken'
    end
  end
end
