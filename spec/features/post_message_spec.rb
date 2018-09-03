feature 'post message' do
  scenario 'user can post a message on chitter' do
    visit('/')
    click_button 'sign up'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button('submit')
    fill_in :peep, with: 'hey!'
    click_button 'post'
    expect(page).to have_content 'hey!'
  end
end
