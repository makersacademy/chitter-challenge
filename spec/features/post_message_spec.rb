feature 'Create a message' do
  scenario 'and view the message on the index page' do
    visit '/'
    fill_in('comment', with: 'Hello Chitter')
    click_button 'Post'
    expect(page).to have_content 'Hello Chitter'
  end
end