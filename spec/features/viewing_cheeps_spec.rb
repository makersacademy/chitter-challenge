# require 'pg'
feature 'viewing cheeps' do
  scenario 'a user can see cheeps' do

    Cheeps.create(cheep: 'this is a test cheep')
    Cheeps.create(cheep: 'this is a 2nd cheep')
    Cheeps.create(cheep: 'oh, look a third!')

    visit('/cheeps')
    expect(page).to have_content 'this is a test cheep'
    expect(page).to have_content 'this is a 2nd cheep'
    expect(page).to have_content 'oh, look a third!'
  end
end
