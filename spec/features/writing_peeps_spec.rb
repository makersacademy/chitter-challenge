feature 'Post peeps' do
  let!(:user) do
    User.create(first_name: 'Annemarie', last_name: 'Kohler', username: 'Anne',
      email: 'anne@chittr.com', password: 'dog', password_confirmation: 'dog')
  end

  scenario 'when user logged in they can post peeps' do
    peep
    expect(current_path).to eq '/'
    expect(page).to have_content('Hi my name is.. Please stand up!')
  end

  scenario 'peeps are displayed newest to oldest' do
    peep
    expect(current_path).to eq '/'
    fill_in :body, with: 'No water in the water fountain'
    click_button 'Peep it'
    expect(current_path).to eq '/'
    expect(page).to have_content('No water in the water fountain')
    expect(page).to have_content('Hi my name is.. Please stand up!')
  end
end
