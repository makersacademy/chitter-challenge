feature 'Viewing Homepage' do
    scenario 'can view the homepage' do
        visit ('/')
        expect(page).to have_content("Chitter - Home")
    end
end