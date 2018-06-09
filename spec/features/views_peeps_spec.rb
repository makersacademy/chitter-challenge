require 'pg'

feature 'viewing peeps' do
    scenario 'user can see peeps' do

        Peep.create(content: "My first peep")
        Peep.create(content: "My second peep")
        Peep.create(content: "My third peep")

        visit('/')
        expect(page).to have_content "My first peep"
        expect(page).to have_content "My second peep"
        expect(page).to have_content "My third peep"
    end

    scenario 'user can see peeps in reverse chronological order' do
        Peep.create(content: "My first peep")
        Peep.create(content: "My second peep")
        Peep.create(content: "My third peep")

        visit('/')
        expect(page).to have_selector("ul li:nth-child(1)", exact_text: "My third peep")
        expect(page).to have_selector("ul li:nth-child(3)", exact_text: "My first peep")
    end
end