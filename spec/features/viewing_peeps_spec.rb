feature 'Viewing peeps' do
  scenario 'visiting the front page' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end

  scenario 'peeps are shown in reverse time order' do
    sign_up_and_go_to_homepage
    fill_in 'text', with: 'Test peep 1'
    click_button 'Peep!'
    fill_in 'text', with: 'Test peep 2'
    click_button 'Peep!'
    fill_in 'text', with: 'Test peep 3'
    click_button 'Peep!'

    expect(page.body) =~ /Test peep 3.*Test peep 2.*Test peep 1/
  end

  scenario 'peeps are shown with user name attached' do
    sign_up_and_go_to_homepage
    fill_in 'text', with: 'Test peep'
    click_button 'Peep!'

    expect(page).to have_content 'Posted by Test at '
  end
end
