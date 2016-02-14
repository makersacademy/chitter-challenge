feature 'timed peeps' do
  scenario 'user can see time of a peep' do
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello, world!'
    click_button'Peep!'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("#{Time.now}")
  end
end
