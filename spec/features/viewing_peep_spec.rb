feature 'Viewing Peeps' do
    scenario 'User can view Peeps' do
        Peep.create("I am having a great day")
        Peep.create("I wonder what the weather is like tomorrow")
        Peep.create("OMG I forgot my keys!")

        visit '/peep'
       
        expect(page).to have_content "I am having a great day"
        expect(page).to have_content  "I wonder what the weather is like tomorrow"
        expect(page).to have_content "OMG I forgot my keys!"
    end
end