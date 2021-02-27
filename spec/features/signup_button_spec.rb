feature 'signup option' do
    scenario 'i can see a button called signup' do
        visit('/')
        click_link 'Sign Up'
        expect(page).to have_content 'Sign Up Page'
    end
    # scenario 'i can fill in my email, password, name and a username' do
    #     visit('/signup')
    #     fill_in :email, with: 'rafswid@icloud.com'
    #     fill_in :password, with: 'cabbage'
    #     fill_in :name, with: 'Raf Swiderski'
    #     fill_in :username, with: 'rafswid'
end