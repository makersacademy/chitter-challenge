feature 'View cheeps' do 
  scenario 'A user can view cheeps' do
    visit('/')
  
    expect(page).to have_content 'Hello Chitter!'
    expect(page).to have_content 'What shall I eat for dinner?'
    expect(page).to have_content ':)'
  end
end