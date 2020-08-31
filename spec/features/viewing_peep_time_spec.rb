

feature 'Viewing peep' do
    scenario 'user can see time peep was created' do
        
        sign_in
        fill_in 'message', with: 'hello, there'
        click_button 'post'
        expect(page).to have_content(DateTime.now.strftime("%H:%M:%S"))
    end

    scenario 'user can see what user created the peep' do
        sign_in
        fill_in 'message', with: 'I am the Senate!!'
        click_button 'post'
        
        expect(page).to have_content('JS_500')
    end
end