feature 'Sign Up in order to post a peep' do
  scenario 'Visit the home page and not see the post peep form since we are not logged in' do
    User.instance_variable_set(:@current_user, nil)
    visit ('/')
    expect(page).not_to have_content "Post a Peep!!!!!"
  end

  scenario 'click sign up and enter my details and be able to see my details' do
    User.instance_variable_set(:@current_user, nil)
    visit '/'
    click_link 'SIGN UP'

    fill_in('user_name', with: 'James Ault')
    fill_in('handle', with: 'tso402')
    click_button 'Submit'

    expect(page).to have_content "Post a Peep!!!!!"
    expect(page).to have_content "James Ault"
    expect(page).to have_content "tso402"
  end

end