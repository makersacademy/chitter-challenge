feature 'Add a cheep' do

  scenario 'I can add a cheep and see it come up on the list' do
    visit('/cheeps')
    fill_in('text', with: "Good morning")
    click_button 'Post Cheep'
    expect(page).to have_content ('Good morning')
  end
end
