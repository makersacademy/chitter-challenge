RSpec.feature 'Add Peep' do 
  context '#create' do 
    let!(:user) { User.create({ firstname: "Carol", surname: "Gardiner", username: "cazzy", email: "caz@caz", password: "secret123" }) }
    scenario 'peep button exists on user profile' do 
      signin_and_submit()
      expect(page.current_path).to eq "/profile/1"
      expect(page).to have_button "PEEP"
    end

    scenario 'user clicks peep' do
      signin_and_submit()
      click_on 'PEEP'
      fill_in :title, with: "Test Title"
      fill_in :content, with: "This is an awesome message"
      click_on "Peep"
      expect(page).to have_content "This is an awesome message"
      expect(page).to have_content "cazzy"
    end
  end 
end
