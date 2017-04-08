feature 'creating noms' do
  scenario 'posting a nom onto the wall' do
    visit('/noms/new')
    fill_in 'nom', with: "Best pizza ever"
    click_button 'Post nom'

    expect(current_path).to eq '/noms'

    within 'ul#noms' do
      expect(page).to have_content('Best pizza ever')
    end
  end
end
