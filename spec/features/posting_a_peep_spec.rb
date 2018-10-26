feature 'Posting peeps' do
  scenario 'user posts a peep' do
    visit '/'
    fill_in 'peep_content', with: 'This is a test peep!'
    click_button 'Post'
    expect(page).to have_content 'This is a test peep!'
  end

  scenario 'user does not see a form to post a peep without being signed in' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'username', with: 'Mittens'
    click_button 'Register'
    expect(page).not_to have_button 'Post'
  end
end
