feature 'peep message' do 
scenario 'a user can post a message' do
    visit ('/')
   expect(page).to have_content 'Welcome to Chitter'
end 
end 
