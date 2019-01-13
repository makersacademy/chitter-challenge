RSpec.feature 'profile' do 
  let!(:user) { User.create({ firstname: "Carol", surname: "Gardiner", username: "cazzy", email: "caz@caz", password: "secret123" }) }
  context '#Signed in' do
    scenario 'displays users details' do
      signin_and_submit
      expect(page).to have_content 'Carol'
      expect(page).to have_content 'caz@caz'
    end
    scenario 'let user log out' do
      signin_and_submit
      click_on 'Log out'
      expect(page.current_path).to eq '/'
    end 
  end 
end
