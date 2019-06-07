feature 'User Register' do
  scenario 'User user can register for Chitter' do
    visit('/register')
    fill_in :name, with: 'Helen'
    fill_in :user_name, with: 'HelenAtMakers'
    fill_in :email_address, with: 'Helen@gmail.com'
    fill_in :password, with: 'Makers2019'
    click_on :Register
    expect(page).to have_content 'Thank you for registering Helen! Please see your details below: User name: HelenAtMakers Email Address: Helen@gmail.com'
  end
end

feature 'Use Chitter' do
  scenario 'Registered User to enter Chitter' do
    visit('/register')
    fill_in :name, with: 'Helen'
    fill_in :user_name, with: 'HelenAtMakers'
    fill_in :email_address, with: 'Helen@gmail.com'
    fill_in :password, with: 'Makers2019'
    click_on :Register
    click_on :Chitter
    expect(page).to have_content 'Welcome to Chitter'
  end
end

# Failing test - /add_peep not working 
feature 'Use Chitter' do
  scenario 'User to submit Peep' do
    visit('/register')
    fill_in :name, with: 'Helen'
    fill_in :user_name, with: 'HelenAtMakers'
    fill_in :email_address, with: 'Helen@gmail.com'
    fill_in :password, with: 'Makers2019'
    click_on :Register
    click_on :Chitter
    fill_in :peep, with: 'Makers week six nearly complete!'
    click_on :Submit
    expect(page).to have_content 'Makers week six nearly complete!'
  end
end