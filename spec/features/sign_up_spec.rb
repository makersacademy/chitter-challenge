feature 'sign up' do

  scenario 'User can sign up' do

    visit '/'
    click_button 'Sign Up'
    fill_in :name, with: 'Daniel'
    fill_in :username, with: 'dlau'
    fill_in :email, with: 'abc@abc.com'
    fill_in :password, with: '1234'
    click_button 'Sign Up'
    expect(page).to have_content('Welcome Daniel')

  end

end
