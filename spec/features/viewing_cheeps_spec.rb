feature 'View cheeps' do 
  scenario 'A user can view cheeps' do
    Cheep.create(cheep: 'Hello Chitter!')
    Cheep.create(cheep: 'What shall I eat for dinner?')
    Cheep.create(cheep: ":)")

    visit('/')
  
    expect(page).to have_content 'Hello Chitter!'
    expect(page).to have_content 'What shall I eat for dinner?'
    expect(page).to have_content ':)'
  end
end