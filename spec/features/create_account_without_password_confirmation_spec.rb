feature 'attempting to create account without password confirmation (entering selected password a second time)' do
    scenario 'Maker cannot create account without supplying a valid password confirmation' do
        expect{ create_account_without_password_confirmation }.to_not change(Maker, :count)
        expect(page).to have_content "Your password confirmation does not match your original password!"
    end

    scenario 'Maker cannot create account unless two matching passwords are supplied' do
        expect{ create_account_without_matching_password }.to_not change(Maker, :count)
        expect(page).to have_content "Your password confirmation does not match your original password!"
    end
end