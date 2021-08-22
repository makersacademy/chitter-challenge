feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a bookmark' do
      visit '/'
      peep = Peep.create("this is a test peep")
      visit '/users/new'
      fill_in('email', with: 'test@test.com')
      fill_in('password', with: 'test_password')
      fill_in('name', with: 'testname')
      fill_in('username', with: 'test_username')
      click_button('Sign up')
      click_button 'Add comment'
      expect(current_path).to eq "/peeps/#{peep.id}/comments/new"

      fill_in 'comment', with: 'This is a test comment on this bookmark'
      click_button('Submit')
      expect(current_path).to eq '/'
      expect(first('.peep')).to have_content 'This is a test comment on this bookmark'
    end
  end
end