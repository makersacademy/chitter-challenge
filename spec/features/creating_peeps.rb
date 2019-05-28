feature 'Posting a peep to Chitter' do 
    scenario "The maker's peep gets posted to Chitter" do 
        visit('/peep/new')
        fill_in('name', with: 'Gary')
        fill_in('message', with: 'I am at work')
        click_button('Peep!')

        expect(page).to have_content ('Gary', 'I am at work') 
    end 
end 

