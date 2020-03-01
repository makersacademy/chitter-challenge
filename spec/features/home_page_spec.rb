feature 'view the homepage' do
    scenario 'check the string in the homepage' do
        visit '/'
        expect(page).to have_content 'Welcome to Chitter'
    end
end