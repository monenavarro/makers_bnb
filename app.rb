require 'sinatra/base'
require 'sinatra/reloader'

require_relative './lib/users'
require_relative './lib/database_connection'

class MakersBnB < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    p @user
    session[:user_id] = @user.id
    redirect '/spaces'
  end

  get '/spaces' do
    @user = User.find(session[:user_id])
    erb(:spaces) #Welcome... take the user information fro the user in the session.
  end

  run! if app_file == $0
end