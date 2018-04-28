feature 'Delete a blah' do
  scenario 'A user can delete their blah' do
    # arrange
    sign_up()

    # act
    fill_in('blah', with: 'A new delete feature test blah')
    click_button('Add blah')

    expect(page.first(:css, '.tile-content')).to have_content('A new delete feature test blah')
    expect(page.first(:css, '.tile-content')).to have_content('Delete')

    page.first(:css, '.tile-content').click_button('Delete')

    # assert
    expect(page.first(:css, '.tile-content')).not_to have_content('A new delete feature test blah')
  end
end
