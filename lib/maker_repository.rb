require_relative 'maker'
require 'bcrypt'
class MakerRepository

  def all

    makers = []

    sql = 'SELECT id, email, password, name, username FROM makers;'
    result_set = DatabaseConnection.exec_params(sql,[])
    result_set.each do |record|
      makers << parse_maker(record)
    end
    
    return makers
  end

  def create(maker)
    return nil if exists_check(maker)
    encrypted_password = BCrypt::Password.create(maker.password)
    sql = 'INSERT INTO makers (email, password, name, username) VALUES ($1, $2, $3, $4);'
    params = [maker.email, encrypted_password, maker.name, maker.username]
    DatabaseConnection.exec_params(sql,params)
    return find_by_email(maker.email)
  end

  def find(id)
    sql = 'SELECT id, email, password, name, username FROM makers WHERE id = $1;'
    params = [id]
    record = DatabaseConnection.exec_params(sql,params).first
    return parse_maker(record)
  end

  def login(email,passed_password)
    maker = find_by_email(email)
    return nil if maker.nil?
    # Compare the submitted password with the encrypted one saved in the database
    if BCrypt::Password.new(maker.password) == passed_password
      return maker
    else
      return nil
    end
  end

  def find_by_email(email)
    sql = 'SELECT id, email, password, name, username FROM makers WHERE email = $1;'
    params = [email]
    record = DatabaseConnection.exec_params(sql,params).first
    return nil if record.nil?
    return parse_maker(record)
  end

  def find_by_username(username)
    sql = 'SELECT id, email, password, name, username FROM makers WHERE username = $1;'
    params = [username]
    record = DatabaseConnection.exec_params(sql,params).first
    return nil if record.nil?
    return parse_maker(record)
  end

  def delete(id)
    sql = 'DELETE FROM makers WHERE id = $1;'
    params = [id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end

  private

  def parse_maker(record)
    maker = Maker.new
    maker.id = record['id'].to_i
    maker.name = record['name']
    maker.email = record['email']
    maker.password = record['password']
    maker.username = record['username']
    return maker
  end

  def exists_check(maker)
    return !find_by_email(maker.email).nil? || !find_by_username(maker.username).nil? 
  end
end
