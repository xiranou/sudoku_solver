require 'rubygems'
require 'bundler'

Bundler.require
# require 'sinatra'
require './models/example'

get "/" do
  @example = Example.call
  erb :home
end