feature 'user sign up' do
  scenario 'to see greeting with username' do
    visit '/'
    click_on 'Sign Up'
    fill_in :username, with: 'user1'
    fill_in :mail, with: 'user@mail.com'
    fill_in :password, with: 'password'
    click_on 'Submit'
    expect(page).to have_content "post a peep user1"
  end
end
