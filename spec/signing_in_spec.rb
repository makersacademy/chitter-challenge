feature 'Viewing sign in page' do 
scenario 'So that a user can post a message they need to sign in' do
    visit ('/')
    # fill_in 'Username' with: 'MegG'
    # fill_in 'Password' with: 'hello123'
    expect(page).to have_content 'Welcome to Chitter. Please sign in'
end 
end 