feature 'User makes peep' do
  before(:each) do
    user_sign_up
    click_button('Sign up')
  end

  scenario 'Peep is posted correctly' do
    post_peep
    expect(page).to have_content('Yo, this is my peep')
  end

  scenario 'Peep is posted with its time of creation' do
    post_peep
    peep_time = Peep.first(name: 'George').time
    expect(page).to have_content(peep_time[0..18])
  end

  scenario 'a new peep instance is created' do
    peep_count_before = Peep.count
    post_peep
    peep_count_after = Peep.count
    expect(peep_count_after).to eq peep_count_before + 1
  end
end

feature 'Post peep inaccessible when not logged in' do
  scenario 'Users can\'t go straight to Make Peep page without logging in' do
    visit('/peeps')
    expect(page).not_to have_content('Fancy posting a peep of your own')
  end
end
