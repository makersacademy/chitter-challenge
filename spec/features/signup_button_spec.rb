feature 'signup option' do
    scenario 'i can see a button called signup' do
        visit('/')
        expect(page).to have_content 'Sign Up'
    end
    scenario 'i can visit the signup page' do
        visit('/')
        click_link 'Sign Up'
        expect(page).to have_content 'Sign Up Page'
    end
end