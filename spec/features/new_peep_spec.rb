feature 'Post a new peep' do
    scenario 'enter peep and click post' do
        visit '/peeps/new'
        fill_in('peep', with: 'My first peep')
        click_button 'Go'
        
        expect(page).to have_content 'My first peep'
    end
end 
