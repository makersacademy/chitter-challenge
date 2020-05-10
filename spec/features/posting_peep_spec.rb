# User Story 1:
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting peeps' do
  scenario 'Posting a peep from the new page' do
    visit('/peeps/new')
    fill_in('text', with: 'Feeling those summer vibes today')
    # fill_in('name', with: 'Andrew')
    click_button('Peep')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Feeling those summer vibes today')
  end

  scenario 'Can access new post page from /peeps' do
    visit('/peeps')
    click_button('New Peep')
    expect(current_path).to eq '/peeps/new'
  end


  scenario 'Add multiple peeps to list' do
    visit('/peeps/new')
    fill_in('text', with: 'Hello guys!')
    click_button('Peep')

    click_button('New Peep')
    fill_in('text', with: 'Chitter > Twitter')
    click_button('Peep')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Hello guys!')
    expect(page).to have_content('Chitter > Twitter')
  end

end
