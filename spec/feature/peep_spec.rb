feature 'viewing and writing peeps' do
  scenario 'can view peeps without logging in' do
    visit '/'
    click_button 'browse_peeps'
    expect(page).to have_content 'Peeps'
  end

  scenario 'can peep when logged in' do
    visit '/'
    fill_in 'login_id', with: 'hyper0009'
    fill_in 'login_pass', with: 'hot7575'
    click_button 'login'
    fill_in 'peep_content', with: 'blah blah'
    click_button 'peep'
    expect(page).to have_content 'blah blah'
  end

  scenario 'cant peep when browsing' do
    visit '/'
    click_button 'browse_peeps'
    expect(page).to have_content 'Sign up to peep'
    click_button 'back_to_signup'
    expect(page).to have_content 'Sign up for Chitter'
  end
end
