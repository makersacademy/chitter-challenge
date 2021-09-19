feature 'attempting to create account without supplying a password' do
    scenario 'maker cannot create account without supplying a password' do
        expect{ create_account_without_password }.to_not change(Maker, :count)
        expect(page).to have_content "You must supply a password to create an account!"
    end
end