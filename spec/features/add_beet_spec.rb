feature 'Adding Beets' do
  scenario 'visiting the timeline' do
    visit('/beets')
    expect(page).to have_content('Bitter')
  end
end