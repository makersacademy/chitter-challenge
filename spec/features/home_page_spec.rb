feature 'visiting the home page' do
  scenario 'see page title' do
    visit '/'
    #within h1?
    expect(page).to have_content('Chitter')
  end

  scenario 'can click sign up button ' do
    visit '/'
    click_button 'Sign Up'
    expect(page).to have_current_path('/sign-up')
    expect(page).to have_content 'Sign up to Chitter'
  end

  scenario 'cannot post if not signed in' do
    visit '/'
    expect(page).not_to have_field 'content'
  end

  scenario 'can sign in and make a post' do
    sign_up
    click_button 'Homepage'
    fill_in 'content', with: 'My first peep!'
    click_button 'Peep!'
    expect(page).to have_content('Ed is logged in!')
    expect(page).to have_content '@ed209: My first peep!' 
    expect(page).to have_content 'posted at'
  end

end
