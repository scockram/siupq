require 'net/http'
require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'sinatra/reloader'

require './models/models'

def is_up?(server, port=80)
  http = Net::HTTP.start(server, port, {open_timeout: 5, read_timeout: 5})
  response = http.head("/")
  response.code == "200"
rescue Timeout::Error, SocketError
  false
end

get '/' do
  "#{Record.last.status} lol"
end

get '/sites' do
  @sites = Site.all
  @new_site = Site.new
  slim :sites
end

post '/sites/new' do
  @site = Site.new(name:params[:name], address:params[:url])
  @site.save
  redirect '/sites'
end

get '/sites/:id/delete' do
  Site.find(params[:id]).destroy
  redirect '/sites'
end

get '/check' do
  #Record.create(status:is_up?())
end

