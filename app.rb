require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'
require 'sinatra/activerecord'

get '/' do
    @medicines = Medicine.all
    erb :index
end

get '/item/create' do
    erb :new
end

post '/item/create' do
    Medicine.create(name: params[:name], number: params[:number])
    erb :new
end