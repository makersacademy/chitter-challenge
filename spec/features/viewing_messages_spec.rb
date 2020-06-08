require 'orderly'
feature 'Viewing messages on chitter home' do
  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_content("Welcome to Chitter!")
  end
end

feature 'Viewing messages in reverse chronological order' do
  scenario 'displays peeps in reverse chronological order' do
    visit('/')
    click_link('Post a new peep')
    fill_in('author', with: 'Victor')
    fill_in('body', with: 'Hello world!')
    fill_in('date', with: '2020-10-02 10:00:00')
    click_button('post')

    visit('/')
    click_link('Post a new peep')
    fill_in('author', with: 'John')
    fill_in('body', with: 'Hello gang!')
    fill_in('date', with: '2020-10-02 11:00:00')
    click_button('post')

    # expect(page).to have_tag("ul:first-child", :text => "John says Hello gang! at 2020-10-02 11:00:00")
    expect('John').to appear_before('Victor')
  end
end