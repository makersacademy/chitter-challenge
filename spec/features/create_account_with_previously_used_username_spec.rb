feature 'create account with previously used username' do
    scenario 'maker cannot create account with previously used username' do
        valid_create_account
        expect{ create_account_with_previously_used_username }.to not_change(Maker, :count)
        expect(page).to have_content "This username is already registered"
    end
end