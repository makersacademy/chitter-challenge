# peeps repository class

require 'date'
require_relative './peep'
require_relative './author'

class PeepsRepository

    def all

        export = []
        # uses join so that the item is specified by name
        # and not just by the ID
        query = DatabaseConnection.exec_params(
            "SELECT peeps.id, peeps.message, peeps.author, peeps.time, accounts.name, accounts.username
            FROM peeps
            INNER JOIN accounts ON peeps.author=accounts.id;",
            []
        )
        query.each do |peep|
            peob = Peep.new
            #
            peob.id = peep["id"]
            peob.message = peep["message"]
            peob.date = Time.at(peep["time"].to_i)
            #
            peob.author = Author.new
            peob.author.id=peep["author"]
            peob.author.name=peep["name"]
            peob.author.username=peep["username"]
            #
            export.append(peob)
        end
        # export as array
        return export

    end

    def find(id)

        peep = DatabaseConnection.exec_params(
            "SELECT peeps.id, peeps.message, peeps.author, peeps.time, accounts.name, accounts.username
            FROM peeps
            INNER JOIN accounts ON peeps.author=accounts.id
            WHERE peeps.id=$1;",
            [id]
        )[0]

        peob = Peep.new
        #
        peob.id = peep["id"]
        peob.message = peep["message"]
        peob.date = Time.at(peep["time"].to_i)
        #
        peob.author = Author.new
        peob.author.id=peep["author"]
        peob.author.name=peep["name"]
        peob.author.username=peep["username"]

        return peob

    end

    def create(message,author_id)

        DatabaseConnection.exec_params(
            "INSERT INTO peeps (message,author,time) VALUES ($1,$2,$3)",
            [
                CGI.escapeHTML(message),
                author_id,
                DateTime.now.strftime('%s')
            ]
        )
        return DatabaseConnection.exec_params(
            "SELECT MAX(id) FROM peeps;",
            []
        )[0]["max"]

    end

end