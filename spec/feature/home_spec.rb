feature 'Home page' do
  scenario 'users can post a message' do
    visit('/')
    fill_in 'comment', with: 'This is a test.'
    click_button('post')
    expect(page).to have_content('This is a test')
  end
  
end