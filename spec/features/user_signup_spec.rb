feature 'user sign up' do
  scenario 'user can sign into the app to view chat' do

    register

    expect( current_path ).to eq '/chat'
    expect( page ).to have_content('Logged in as Chloe')
    expect{ register }.to change{ User.count }.by(1)

  end
end
