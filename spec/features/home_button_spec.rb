feature 'home button' do
    scenario 'i can see a button called home' do
        visit('/')
        expect(page).to have_content 'Home'
    end
    scenario 'the home button takes me to the chitter feed' do
        visit('/')
        click_link('Home')
        expect(page).to have_content 'Home Page'
    end
end