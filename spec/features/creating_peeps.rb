feature 'Posting a peep to Chitter' do 
    scenario "The maker's peep gets posted to Chitter" do 
        peep_1

        expect(page).to have_content ('Gary', 'I am at work') 
    end 
end 






