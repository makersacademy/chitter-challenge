feature "View a welcome chitter message" do 
    scenario "A user can view a welcome message" do 
        visit('/')
        expect(page).to have_content 'Welcome to chitter'
    end 
end 

feature "post a message to Chitter" do 
    scenario "As a Maker I want to be able to add a new message" do 
    visit('/')

        expect(page).to have_message("Users Message")
    end 
end 