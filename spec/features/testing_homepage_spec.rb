feature 'visiting homepage' do
scenario 'checking welcome message' do
visit('/')
expect(page).to have_content "Welcome to Chitter"
end
end