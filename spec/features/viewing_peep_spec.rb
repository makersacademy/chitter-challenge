feature 'Viewing Peeps' do
    scenario 'User can view Peeps' do
        visit '/peep'
        # fill_in('peep', :with => "I'm having a great day")
        # click_button 'submit'
        expect(page).to have_content "I'm having a great day"
        expect(page).to have_content  "I wonder what the waether is like tomorrow"
        expect(page).to have_content "OMG I forgot my keys!"
    end
end