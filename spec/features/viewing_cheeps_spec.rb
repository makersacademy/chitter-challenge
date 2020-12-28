feature 'Viewing cheeps' do
  scenario 'visiting the cheep feed' do
    visit('/cheep_feed')
    expect(page).to have_content "First cheep Second cheep Third cheep"
  end
end