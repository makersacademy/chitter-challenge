feature 'attempting to create account without supplying an email address' do
    scenario 'maker cannot create account without supplying an email address' do
        expect{ create_account_without_email_address }.to_not change(Maker, :count)
        expect(page).to have_content "You must supply an email address to create an account!"
    end
end