feature 'Like' do
  scenario '> will add a like to the peep' do
    sign_up_correctly
    click_button 'Add peep'
    fill_in :message, with: 'Hello World!'
    click_button 'Peep Away!'
    within 'ul#peeps' do
      expect{click_button 'like'}.to change{Like.count}.by 1
    end
  end
end
