feature 'creates peeps' do
  before(:all) do
    sign_up
    sign_in
  end

  scenario 'user posts a peep to Chitter' do
    expect{ post_peep }.to change{ User.first.peeps.count }.by 1
    expect(page.status_code).to eq(200)
    expect(page).to have_content 'Hello world'
  end
end
