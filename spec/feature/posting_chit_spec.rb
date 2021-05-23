feature 'Viewing bookmarks' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content("Chitter challenge")
  end
end

feature 'expect to see all chirps' do
  scenario 'a user can display their chirps' do
    visit('/chitter')
    click_button('Chirp')
    fill_in('chirp', with: 'peep')
    click_button('Chirp')
    expect(page).to have_content('peep')
  end
end

feature 'posts a chirp' do
  scenario 'a user can display their chirp' do
    visit('/chitter')
    click_button('Chirp')
    fill_in('chirp', with: 'peep')
    click_button('Chirp')
    expect(page).to have_content('peep')
  end
end

feature 'deletes a chirp' do
  scenario 'a chirp must be deleted' do
    visit('/chitter')
    click_button('Chirp')
    fill_in('chirp', with: 'peep')
    click_button('Chirp')
    click_button('Delete')
    expect(page).not_to have_content('peep')
  end
end

