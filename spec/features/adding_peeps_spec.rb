feature 'Adding peeps' do

  before(:each) do
    User.create(name: 'Marley',
                username: 'Luni',
                email: 'marley@cat.com',
                password: 'dreamies',
                password_confirmation: 'dreamies')
    end

  scenario 'I can add a new peep' do
    log_in(username: 'Luni', password: 'dreamies')
    click_button 'Add peep'
    expect(current_path).to eq '/peeps/new'
    fill_in 'title', with: 'Cats'
    fill_in 'content', with: 'Sleeping peacefully!'
    click_button 'Post peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Sleeping peacefully!')
    end
  end
end
