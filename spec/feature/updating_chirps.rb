feature 'Updating a chirp' do
  scenario 'a user can change their chirp' do
    visit('/chitter')
    click_button('Chirp')
    fill_in('chirp', with: 'peep')
    click_button('Chirp')

    first('.chirp').click_button('Edit')
    expect(current_path).to eq('/chitter/#{bookmark.id}/edit')

    fill_in('Re-chirp', with: 'twoot')
    click_button('Re-chirp')

    expect(current_path).to eq('/chitter')
    expect(page).not_to have_content('peep')
    expect(page).to have_content('twoot')
  end
end
