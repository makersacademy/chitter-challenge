feature 'test' do 
    scenario 'it should test the testing framework is working' do 
        visit '/test'
        expect(page).to have_content "Hello chitter"
    end
end