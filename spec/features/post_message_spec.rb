feature 'user can post message and see it on the site' do
  scenario 'user can input message on form and post it' do
    visit '/'
    fill_in 'content', with: 'Test Post'
    click_button 'Post'
    expect(page).to have_content 'Test Post'
  end
end
