describe 'User Interface', type: :feature do

  before do
    visit('/')
  end
  
  context 'Check page layout' do

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
      instance = PGDatabase.create_message(user_id: 1, message:'test').first
      check_stored = select_all_from_message(id: instance.id) 

      expect(instance).to be_a Message
      expect(instance.id).to eq check_stored['id']
      expect(instance.message).to eq 'test'
    end

  end

  context 'I want to see all peeps in reverse chronological order' do

    it 'displays dummy data' do
      visit('/home')
      expect(page).to have_content("Lovely Stuff")
      expect(page).to have_content("Lovely Stuff 2")
    end

  end

end
