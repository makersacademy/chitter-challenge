feature 'I can use chitter to' do
  scenario 'post a peep to the database' do
    peep = 'This is a sample peep.'
    expect { post_a peep }.to change(Peep, :count).by(1)
  end
  scenario 'while I am logged in'
  scenario 'but not if I am logged out'
end