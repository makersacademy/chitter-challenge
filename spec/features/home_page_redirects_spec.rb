feature "home page redirects to '/peep/all'" do
  scenario 'so a user can see all peeps the home page will redirect' do
    visit '/'
    expect(page).to have_current_path '/peep/all'
  end
end
