feature 'Viewing peep' do
    scenario 'user can see time peep was created' do
        visit('/')
        fill_in 'message', with: 'hello, there'
        click_button 'post'
        expect(page).to have_content(DateTime.now.strftime("%H:%M:%S"))
    end
end