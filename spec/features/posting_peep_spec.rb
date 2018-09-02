feature 'Posting a peep' do
  scenario 'peep, current user name and user name are displayed ' do
    visit('/')
    click_button('SIGN UP')
    sign_up_three
    log_in_three
    view_and_post_peep
    expect(page).to have_content('peep test')
    expect(page).to have_content('name test three')
    expect(page).to have_content('user name test')

  end

  scenario 'post more than one peep that gets displayed' do
    visit('/')
    click_button('SIGN UP')
    sign_up_one
    log_in_one
    view_and_post_peep
    click_button('POST A PEEP')
    fill_in('peep_field', with: 'more peep test')
    click_button('Submit')
    expect(page).to have_content('peep test')
    expect(page).to have_content('more peep test')
  end

end
