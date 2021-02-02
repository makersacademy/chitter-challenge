feature 'Confirm basic application setup' do
    scenario 'Run app and check landing page' do
        visit '/'
        expect(page).to have_content 'Welcome to Chitter!'
    end
end