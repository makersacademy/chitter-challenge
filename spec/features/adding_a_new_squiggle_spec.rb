feature 'Adding a new squiggle' do
  scenario 'A user can add a Squiggle to the Fowwest' do
    visit('/squiggles')
    fill_in('squiggle', with: 'Hello I am a squiggle posting a squiggle.')
    click_button('Add to Fowwest')

    expect(page).to have_content 'H🌰ll🌰 I 🌰m 🌰 sq🌰🌰ggl🌰 p🌰st🌰ng 🌰 sq🌰🌰ggl🌰'
  end
end
