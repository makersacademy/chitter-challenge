feature 'maker can signout' do
    scenario 'maker signs out assuming already signed in' do
        valid_create_account
        click_button 'signout'
        expect(page).not_to have_content 'Hello, Clive Myrie'
    end
end