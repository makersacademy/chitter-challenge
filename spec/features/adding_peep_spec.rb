feature 'FEATURE: adding peep' do
    scenario 'user can create peep' do
      create_peep(content: 'Hi')
      expect(page).to have_content 'Hi'
    end
end
