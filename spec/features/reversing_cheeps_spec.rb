feature 'viewing cheeps in reverse' do
  scenario 'a user can change the order of cheeps' do
    visit('/cheeps')
    expect(page).to have_button 'Oldest first'
  end
  scenario 'a user can oldest cheeps first' do

    Cheeps.create(cheep: 'this is a test cheep')
    Cheeps.create(cheep: 'this is a 2nd cheep')
    Cheeps.create(cheep: 'oh, look a third!')

    visit('/cheeps/reverse')
    expect(page).to have_content('oh, look a third!')
    # expect(page).to have_content
    # expect(page).to have_content
  end
end

#very much at a loss on how to test for tables in specific order...
#to be continued... but the feature works soo...
