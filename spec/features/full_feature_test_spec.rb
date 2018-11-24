feature "Sign up and post" do
  scenario "a user can sign up and submit a post" do
    visit('/')
    click_button 'Sign up here!'
    fill_in('username', with: 'leoncross')
    fill_in('name', with: 'leon')
    fill_in('email', with: 'leon@email.com')
    fill_in('password', with: '12345')
    click_button 'Submit'
    click_button 'Make your first peep!'
    fill_in('username', with: 'leoncross')
    fill_in('name', with: 'leon')
    fill_in('message', with: 'My very first peep!!!')
    click_button 'Submit'
    expect(page).to have_content 'My very first peep!!!'
  end
end
