feature 'Creating Peeps' do
    
  before :each do 
    visit '/users/new'
    fill_in :email, with: 'thomas@test.com'
    fill_in :password, with: 'password'
    click_on 'Submit'
  end
  
  context 'when on Create Peep page' do
    scenario 'user sees content box' do
      visit '/peeps/new'
      expect(page).to have_field "content"
    end
  end

  context 'after creating a Peep' do
    before :each do
      visit '/peeps/new'
      fill_in 'content', with: "My first peep"
      click_on 'Post'
    end

    scenario 'user is taken to home page' do
      expect(current_path).to eq '/'
    end

    scenario 'user can see Peep on page' do
      #byebug
      expect(page).to have_content "My first peep"
    end
  end
end