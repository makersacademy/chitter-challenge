feature 'Viewing peeps' do
  # Sessions? Have someone else log in and post then view all
  # Capybara session names
  scenario 'can see logged in user\'s peeps on the homepage' do
    sign_up
    post_peep('Hiya!')
    post_peep('Howdy!')
    expect(current_path).to eq('/')
    expect(page).to have_content('Hiya!')
    expect(page).to have_content('Howdy!')
  end

  xscenario 'peep is visible under "My Peeps" after submission'
end
