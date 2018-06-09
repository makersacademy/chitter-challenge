describe Film do
  it 'User can add a film' do
    # Setup
    film = {title: "Movie Title",rating: "8"}
    # Exercise
    Film.create(film)
    # Verification
    expect(Film.all).to include film
  end

end
