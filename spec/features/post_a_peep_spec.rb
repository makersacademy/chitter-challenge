feature 'post peeps' do
  scenario 'user composes and posts a peep' do
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello, world!'
    click_button'Peep!'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Hello, world!')
  end
end
