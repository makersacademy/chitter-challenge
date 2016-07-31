feature 'Create cheep' do

  scenario 'when not signed in' do
    visit('/cheeps/new')
    expect(page).to(have_content("You must be signed in to cheep"))
    click_button("Back to homepage")
    expect(current_path).to(eq('/cheeps'))
  end

  scenario 'when signed in' do
    sign_up
    click_button("New cheep")
    fill_in :content, with: "This is a cheep"
    click_button("Cheep!")
    expect(current_path).to(eq('/cheeps'))
    expect(page).to(have_content('This is a cheep'))
  end

end
