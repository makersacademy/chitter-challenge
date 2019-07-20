feature 'displays peeps in reverse chronological order' do
  scenario 'sees all peeps in chronological order' do
    visit('/')
    fill_in "peep", with: 'Hello, Chitter!'
    click_button('Peep!')
    fill_in "peep", with: 'Hello, Chitter again!'
    click_button('Peep!')
    fill_in "peep", with: 'Hello, Chitter again and again!'
    click_button('Peep!')
    visit('/peeps')
    expect(page).to have_content 'Hello, Chitter!'
    expect(page).to have_content 'Hello, Chitter again!'
    expect(page).to have_content 'Hello, Chitter again and again!'
  end
end
