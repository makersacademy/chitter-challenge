feature 'Create a peep' do

  let!(:user) do
    User.create(username: 'mrmurtz',
                email: 'murtz@gmail.com',
                password:  '1234',
                password_confirmation: '1234')
              end

    scenario 'I can click to compose a new peep' do
      log_in
      click_button 'Share a peep'
      expect(current_path).to eq '/peeps/new'
    end

    scenario 'I can write a peep and share it' do
      log_in
      click_button 'Share a peep'
      fill_in('peep', :with => 'Hello world!')
      click_button('Peep')
      expect(page).to have_content 'Hello world!'
    end

  end
