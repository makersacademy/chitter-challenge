feature 'Visiting homepage' do
  scenario 'user can see a greeting and a link to peeps page' do
    visit '/'

    expect(page).to have_content 'Welcome to Chitter!'

    click_link('this link')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Peep it all the way!'
  end
end
