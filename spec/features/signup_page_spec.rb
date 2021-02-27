feature 'i can sign up to chitter' do
    scenario 'i can fill in my email, password, name and username' do
        visit('/')
        click_link('Sign Up')
        fill_in :email, with: 'rafswid@icloud.com'
        fill_in :password, with: 'cabbage'
        fill_in :name, with: 'Raf Swiderski'
        fill_in :username, with: 'rafswid'
        click_link('Sign Up')
        expect(page).to have_content 'Logged in as: rafswid'
