feature 'Commenting on peeps' do
  scenario 'Users can comment on peeps' do
    signs_in_successfully
    post_a_peep
    visit '/peeps/1'
    expect(page).to have_content 'This is a peep!'
    post_comment
    expect(page).to have_current_path('/peeps/1')
    expect(page).to have_content 'An awesome comment!'
  end
end
