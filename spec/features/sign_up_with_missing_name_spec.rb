feature 'Validate name on sign up' do
  scenario 'Missing name' do
    sign_up_with_missing_name
    expect(page).to have_content 'Name must not be blank'
  end
end

