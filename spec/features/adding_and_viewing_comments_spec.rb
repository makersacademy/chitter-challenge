feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a bookmark' do
      visit '/'
      peep = Peep.create("this is a test peep")
      sign_up
      click_button 'Add comment'
      expect(current_path).to eq "/peeps/#{peep.id}/comments/new"

      fill_in 'comment', with: 'This is a test comment'
      click_button('Submit')
      expect(current_path).to eq '/'
      expect(page).to have_content 'This is a test comment'
    end
  end
end
