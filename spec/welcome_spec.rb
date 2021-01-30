feature 'basic setup' do 
scenario 'running app successfully' do
    visit ('/')
   expect(page).to have_content 'Welcome to Chitter!'
end 
end 
