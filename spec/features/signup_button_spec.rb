feature 'signup option' do
    scenario 'i can see a button called signup' do
        visit('/')
        expect(page).to have_content 'Sign Up'
    end
end