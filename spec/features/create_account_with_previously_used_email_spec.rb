feature 'create account with previously used email address' do
    scenario 'maker cannot create new account with previously used email address' do
        valid_create_account
        expect{ valid_create_account }.to_not change(Maker, :count)
        expect(page).to have_content 'This email address has already been registered'
    end
end