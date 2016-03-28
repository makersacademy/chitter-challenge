feature 'Post peeps' do
  let!(:user) do
    User.create(first_name: 'Annemarie', last_name: 'Kohler', username: 'Anne',
      email: 'anne@chittr.com', password: 'dog', password_confirmation: 'dog')
  end

  scenario 'when user logged in they can post peeps' do
    sign_in
    fill_in :body, with: 'Hi my name is.. Please stand up!'
    click_button 'Peep it'
    expect(current_path).to eq '/'
    expect(page).to have_content('Hi my name is.. Please stand up!')
  end
end
