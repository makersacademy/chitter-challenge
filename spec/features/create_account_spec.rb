feature 'create Chitter account' do
    scenario 'click on homepage to go to create account page' do
        visit '/'
        expect(page.current_path).to eq '/createaccount'
    end

    scenario 'following account creation, makers can post Peeps' do
        valid_create_account
        expect(page).to have_content 'Hello, Clive Myrie'
        expect(Maker.count).to eq 1
    end

end