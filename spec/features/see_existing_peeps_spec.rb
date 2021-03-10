feature '#see peeps' do
    scenario 'view a list of existing peeps' do
        visit('/new')
        fill_in("body", with: "Example cheet")
        click_button "Post"
        expect(page).to have_content "Example cheet"
    end
end