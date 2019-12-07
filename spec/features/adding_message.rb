feature "adding new message" do
    scenario "user can add a message" do
        visit 'messages/new'
        fill_in('msg', with: "hello world")
        click_button("Post")
        expect(page).to have_content("hello world")
        #expect(page).to have_content(timestamp)
    end
end