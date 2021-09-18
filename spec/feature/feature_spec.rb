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

    it 'confirms data added was correct' do
      instance = PGDatabase.create_message(user_id: 1, message:'test')
      
      check_stored = PGDatabase.con.exec_params("SELECT * FROM message WHERE id = $1;", [instance[0].id]).first
      expect(instance[0]).to be_a Message
      expect(instance[0].id).to eq check_stored['id']
      expect(instance[0].message).to eq 'test'
    end

  end

end
