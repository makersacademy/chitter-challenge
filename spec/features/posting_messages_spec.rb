feature 'posting messages' do
  scenario 'post a message' do
    visit('/')
    click_link('Post a new peep')
    fill_in('author', with: 'Victor')
    fill_in('body', with: 'Hello world!')
    fill_in('date', with: '2020-10-02 10:00:00')
    click_button('post')
    expect(page).to have_content('Victor says Hello world! at 2020-10-02 10:00:00')
  end
end
