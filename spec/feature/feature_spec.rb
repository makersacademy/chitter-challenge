describe 'User Interface', type: :feature do

  before do
    visit('/')
  end
  
  context 'check it is working' do

    it 'checks page' do
      visit('/home')
      expect(page).to have_content("message A")
      expect(page).to have_content("message B")
    end

  end

end
