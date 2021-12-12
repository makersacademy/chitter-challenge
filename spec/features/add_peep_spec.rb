feature 'adding a new peep' do

    before do
        visit('/add-peep')
    end

    scenario 'fill in message box with peep' do
        expect(page.has_field?("message")).to be_truthy
    end

    scenario 'has a Post button' do
        expect(page.has_button?('Post')).to be_truthy
    end

    scenario 'posts a peep' do
        fill_in("message", with: "Hello! This is my first peep!")
        click_button("Post")

        expect(page).to have_content("Hello! This is my first peep!")      
    end
end