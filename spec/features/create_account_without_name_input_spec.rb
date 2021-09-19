feature 'attempting to create account without using a name' do
    scenario 'maker cannot create account without supplying a name' do
        expect{ sign_up_without_name }.to_not change(Maker, :count)
        expect(page).to have_content "You must supply a name to create an account!"
    end
end