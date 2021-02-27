feature 'adding a peep' do
    scenario 'creating a peep message' do
        visit ('/')
        fill_in 'name', with: 'joanna'
        fill_in 'username', with: 'jojobrigs'
        fill_in 'message', with: 'this is my first peep'
        click_button 'Peep!'
        expect(page).to have_content 'joanna'
        expect(page).to have_content 'jojobrigs'
        expect(page).to have_content 'this is my first peep'
    end
end

