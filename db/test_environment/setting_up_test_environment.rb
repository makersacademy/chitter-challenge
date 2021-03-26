describe  do
    it  do
      connection = PG.connect(dbname: 'chitter_test')
      Message.add("Hello peeps")
      expect(User.all).to include("Hello peeps")
    end
  end

  describe  do
      it  do
        connection = PG.connect(dbname: 'chitter_test')
        connection.exec("INSERT INTO (messages) VALUES('Hello peeps');")
        expect(User.all).to include("Hello peeps")
      end
    end
