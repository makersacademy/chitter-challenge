require 'pry'
feature 'edit peep' do
  scenario 'user wants to edit a peep' do
    sign_up_user
    click_button("home")
    click_button('peep')
    fill_in('post', with: 'A peep to edit!')
    click_button('Submit')
    click_button 'Edit'
    fill_in('post', with: 'This peep has been edited!')
    click_button('Submit')
    expect(page).not_to have_content('A peep to forget!')
    expect(page).to have_content('This peep has been edited!')
  end
end
