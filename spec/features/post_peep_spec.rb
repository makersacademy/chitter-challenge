feature 'Post a new peep' do
    scenario 'enter peep and click post' do
        visit '/peeps/new'
        fill_in('message', with: 'Hello, I am a test Peep')
        click_button 'Submit'
        
        expect(page).to have_content 'Hello, I am a test Peep'
    end
end