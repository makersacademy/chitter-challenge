describe 'User Interface', type: :feature do

  before do
    visit('/')
  end
  
  context 'check it is working' do

    it 'checks page' do
      expect(page).to have_content("hi")
    end

  end

end
