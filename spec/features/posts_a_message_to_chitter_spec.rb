feature 'posts messages to chitter' do
  scenario 'can post messages to chitter' do
    visit('/')
    fill_in "peep", with: 'Hello, Chitter!'
    click_button('Peep!')
    visit('/peeps')
    expect(page).to have_content('Hello, Chitter!')
  end
end
