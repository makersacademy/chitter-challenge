feature 'testing homepage' do
    scenario 'making sure the framework is running' do
        visit '/'
        expect(page).to have_content('Chitter')
    end
end