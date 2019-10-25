feature "viewing peeps" do
  scenario 'a user can view peeps' do
    visit('/peeps/new')
    fill_in('message', with: 'this is a test')
    click_button('Submit')

    expect(page).to have_content('this is a test')

  end
end
