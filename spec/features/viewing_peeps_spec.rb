feature 'chitter feed' do

  scenario 'checks that the / allows us to view our peeps' do

    Chitter.create(message: 'hello, welcome to Chitter!')
    Chitter.create(message: 'photo of my lovely piece of broccoli')
    Chitter.create(message: 'selfie photo of me')

    visit '/'

    expect(page). to have_content('hello, welcome to Chitter!')
    expect(page). to have_content('photo of my lovely piece of broccoli')
    expect(page). to have_content('selfie photo of me')
  end
  
end