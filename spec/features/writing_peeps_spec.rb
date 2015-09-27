require_relative '../../app/data_mapper_setup'

feature 'Writing peeps' do

  scenario 'I can write a new peep' do
    user = create :user
    visit '/feed/new'
    fill_in 'peep', with: 'hello'
    click_button 'Send peep'
    expect(current_path).to eq '/feed'

    within 'ul#feed' do
      expect(page).to have_content('hello')
    end
  end

  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

  scenario 'I can only write a peep if logged in' do
    user = create :user
    sign_in(user)
    click_button 'Sign out'
    visit '/feed'
    expect(page).not_to have_selector("input[type=submit][value='Write peep']")
  end
end
