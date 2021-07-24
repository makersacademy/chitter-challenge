feature 'create peep as user' do
  scenario 'can create a peep as a user after signing up' do
    sign_up
    click_link('Create new peep')
    post_peep

    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Posted by exampleusername')
  end
end
