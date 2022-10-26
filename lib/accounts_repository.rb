# accounts repository class

require 'bcrypt'
require_relative './account'

class AccountsRepository
    include BCrypt

    def find(id)

        if(id.nil?)
            return nil
        end

        query_all = DatabaseConnection.exec_params(
            "SELECT * FROM accounts WHERE id=$1",
            [id]
        )

        if(query_all.num_tuples > 0)

            query = query_all[0]
            obj = Account.new
            obj.id = id
            obj.email = query["email"]
            obj.name = query["name"]
            obj.username = query["username"]
            return obj

        else

            return nil

        end

    end

    def create(params)

        # check email does not already exist
        if(DatabaseConnection.exec_params("SELECT * FROM accounts WHERE email=$1",[params[:email]]).num_tuples > 0)
            return false
        end

        # ecrypt the password
        hash_pw = BCrypt::Password.create(params[:password])

        # sanitise inputs
        name_san = CGI.escapeHTML(params[:name])
        username_san = CGI.escapeHTML(params[:username])

        # insert details
        DatabaseConnection.exec_params(
            "INSERT INTO accounts (email,password,name,username) VALUES ($1,$2,$3,$4);",
            [
                params[:email],
                hash_pw,
                name_san,
                username_san
            ]
        )

        # get the id of the account that has just been created
        id_of_new_account = DatabaseConnection.exec_params(
            "SELECT MAX(id) FROM accounts;",
            []
        )[0]["max"]

        # return the id for the session (this is
        # not the best way to set a user session,
        # since the ID is not secret - a token
        # representing the user/ID would be better)
        return id_of_new_account

    end

    def authenticate(email,password)

        query = DatabaseConnection.exec_params(
            "SELECT * FROM accounts WHERE email=$1",
            [email]
        )

        if(query.num_tuples > 0)
            data = query[0]
            pw = BCrypt::Password.new(data["password"])
            if(pw == password)
                return data["id"]
            else
                return false
            end
        else
            return false
        end

    end

end