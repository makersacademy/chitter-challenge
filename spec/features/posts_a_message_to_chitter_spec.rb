feature 'posts messages to chitter' do
  scenario 'can post messages to chitter' do
    register_user
    fill_in "peep", with: 'Hello, Chitter!'
    click_button('Peep!')
    expect(page).to have_content('Hello, Chitter!')
  end
end
