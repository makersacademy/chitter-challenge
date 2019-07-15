
feature 'is posting message on web' do
  scenario 'visiting index page to post a message' do
    visit ('/peep')
    expect(page).to have_content "Your New Peep is now life!"
  end
end 
