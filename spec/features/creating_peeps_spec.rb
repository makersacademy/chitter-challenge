feature 'creating peeps' do
    scenario 'A user can create a peep' do
        visit ('/peeps/new')
        fill_in('content', with: 'Hello, my name is Ziad')
        click_button("Submit")
        expect(page).to have_content 'Hello, my name is Ziad'
    end
end