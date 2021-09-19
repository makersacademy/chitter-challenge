feature 'attempting to create account without supplying a username' do
    scenario 'maker cannot create account without supplying a username' do
        expect{ create_account_without_username }.to_not change(Maker, :count)
        expect(page).to have_content "You must supply a username to create an account!"
    end
end