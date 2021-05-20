feature 'posting messages' do
  scenario 'a message is added' do
    visit('/')
    fill_in(:peep, with: 'This is a message')
    click_button('Post')
    expect(page).to have_content('This is a message')
  end
end