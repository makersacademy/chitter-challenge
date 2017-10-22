feature 'allows users to add peeps' do
   scenario 'user can add peeps and fill in user name' do
     visit '/peeps/new'
     fill_in "message", with: 'Hello sunshine'
     fill_in "name", with: 'CWong'
     click_button "Create peep"

     expect(current_path).to eq '/peeps'

     within 'ul#peeps' do
       expect(page).to have_content('Hello sunshine')
     end
   end
  end
