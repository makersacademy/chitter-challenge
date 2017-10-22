feature 'Maker sign up' do
  scenario 'I can sign up as a Maker to use Chitter' do
    expect { sign_up }.to change(Maker, :count).by(1)
    expect(page).to have_content('Welcome, timjones10')
    expect(Maker.first.email).to eq('timjones10@hotmail.com')
  end
end
