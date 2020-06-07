feature 'posting messages' do
  scenario 'post a message' do
    visit('/')
    fill_in('peep', with: 'Hello world!')
    click_button('post')
    expect(page).to have_content('Hello world!')
  end
end