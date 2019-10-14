feature 'Remove a cheep' do

  scenario 'I can remove a cheep and see it disappear from the list' do
    visit('/cheeps')
    fill_in('text', with: "Good morning")
    click_button 'Post Cheep'
    expect(page).to have_content ('Good morning')

    first('.cheep').click_button 'Delete'

    expect(current_path).to eq '/cheeps'
    expect(page).not_to have_content('Good morning')
  end
end
