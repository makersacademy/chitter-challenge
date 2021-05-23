feature 'Viewing chirps' do
    feature 'visiting the homepage' do
        scenario 'the page title is visible' do
            visit '/'
            expect(page).to have_content 'Chitter Challenge'
        end
    end
end