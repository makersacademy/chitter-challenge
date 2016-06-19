feature 'Home page' do
  scenario 'User isn\'t logged in' do
    visit '/'
    expect(page).to have_content("Hey, Guest!")
  end
end
