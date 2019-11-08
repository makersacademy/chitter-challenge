feature 'Check that infrastructure is working' do
    scenario 'View is returned' do
        visit('/')
        expect(page).to have_content 'Welcome to Chitter'
    end
end