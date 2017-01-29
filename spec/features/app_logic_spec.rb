feature 'General logic of the application' do
  context 'when logging in' do
    scenario 'can choose to sign up instead' do
      visit ('/')
      expect(page).to have_content 'If you are not registered to Chitter yet, you should sign up!'
      click_button 'sign up'
      #expect {page.current_path}.to become_eq('/signup')
      expect(current_path).to eq '/signup'
    end
  end
end
