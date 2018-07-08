
feature 'Viewing peeps with time' do

  scenario ' A user can see peeps and the time posted' do
    sign_up
    log_in
    fill_in('comment', with: 'This is a peep')
    click_button('Peep This!')
    expect(page).to have_content('This is a peep')
  end

end
