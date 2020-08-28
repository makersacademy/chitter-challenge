feature 'View cheeps' do 
  scenario 'A user can view cheeps' do
    visit('/')
    cheeps = Cheep.all 

    expect(cheeps).to include('Hello Chitter!')
    expect(cheeps).to include('What shall I eat for dinner?')
    expect(cheeps).to include(':)')
  end
end