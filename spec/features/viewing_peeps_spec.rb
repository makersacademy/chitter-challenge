feature 'viewing all peeps' do
    scenario 'it shows all peeps' do
        visit ('/chitter')
        expect(page).to have_content 'Test Peep'
    end
end 
