feature 'Posts message' do
    scenario 'post a message to the chitter page' do
        visit('/new')
        fill_in("message", with: "Example cheet")
        click_button "Post"
        visit('/')
        expect(page).to have_content "Example cheet"
    end
end