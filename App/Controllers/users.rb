# frozen_string_literal: true
require 'sinatra'
require 'sinatra/activerecord'
require_relative '../models/user'

class Users < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  path = '/users'

  get("#{path}/:id") do

  end

  get("#{path}/") do

  end

  post("#{path}") do
    # params = (first_name,last_name,username,password,email)
    # TODO create database entry
    # TODO assign hashed_password_id + create
    # TODO Send sign up email
    # TODO send RESPONSE okay as response
  end

  post("#{path}/log-out") do
    # params = username_or_email,password
    # TODO Authentication check -> password
    # TODO respond with relavent cookies
  end
  post("#{path}/log-in") do
    # params = username_or_email,password
    # TODO Authentication check -> password
    # TODO respond with relavent cookies
  end

end
