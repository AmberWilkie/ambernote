require 'bundler'
Bundler.require
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }
require_relative 'helpers/data_mapper'
# require_relative 'helpers/warden'
require 'pry'

class AmberNote < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/myhome' do
    erb :myhome
  end

  post '/' do
    @user = User.new(params['user'])
    if @user.authenticate(@user[:password])
      redirect '/myhome'
    else
      redirect '/'
    end
  end

end
