feature 'a new user can sign up to chitter' do

  scenario 'a new user signs up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to chitter Kate McCaffrey!')
    expect(User.first.email).to eq('mac@shaper.com')
  end

  scenario 'it is not possible to sign up if the email field is left blank' do
    visit('/users/new')
    fill_in :name,      with: 'Gabriel Santiago'
    fill_in :user_name, with: 'ConsumateProfessional'
    fill_in :email,     with: nil
    fill_in :password,  with: 'netrunner2'
    expect { click_button('Sign me up!') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'it is not possible to sign up if the user does not provide a valid email address' do
    visit('/users/new')
    fill_in :name,      with: 'Gabriel Santiago'
    fill_in :user_name, with: 'ConsumateProfessional'
    fill_in :email,     with: 'not_an@email'
    fill_in :password,  with: 'netrunner2'
    expect { click_button('Sign me up!') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'it is not possible to sign up if the email address has already been registered' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
