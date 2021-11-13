
feature 'Creating Chitter home page' do
    scenario 'User can view the home page' do
        visit('/')
        expect(page).to have_content 'Chitter page working!'
    end
end