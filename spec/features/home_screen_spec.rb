feature 'should display home page' do
    scenario 'should display correct home page content' do
        visit('/')
        expect(page).to have_content('Welcome to Chitter')
        expect(page).to have_content('Make an account if you dont have one')
        expect(page).to have_content('Messages')
    end
end