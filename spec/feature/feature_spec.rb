describe 'User Interface', type: :feature do

  before do
    visit('/')
  end
  
  context 'Check page layout' do

    it 'checks home page' do
      visit('/home')
      expect(page).to have_content("message A")
      expect(page).to have_content("message B")
    end

    it 'has navbar' do 
      expect(page).to have_content("Chitter")
    end

  end

  context 'I want to post a message (peep) to chitter' do

    it 'checks form submits' do
      visit('/home')
      fill_in('post-message', with: 'Party')
      click_button('Post')
      expect(page).to have_current_path '/home'
    end

  end

end
