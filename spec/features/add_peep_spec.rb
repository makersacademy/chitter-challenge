feature 'adding peeps' do
    scenario 'fill in text box and submit' do
        visit '/new'
        fill_in('post', with: 'my first peep')
        click_button('Submit')
        expect(page).to have_content('my first peep')
    end
end