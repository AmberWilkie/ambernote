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

  get '/new_entry' do
    erb :new_entry
  end

  post '/' do
    @user = User.new(params['user'])
    if @user.authenticate(@user[:password])
      redirect '/myhome'
    else
      redirect '/'
    end
  end

  post '/new_entry' do
    ## Test user that will have to be removed when I get registration working
    if User.count == 0
      @user = User.new(username: "amber", password: "amber")
      @user.save
    else
    end

    @entry = Entry.new
    @entry.finished = params[:finished_projects]
    @entry.user = @user
    if @entry.save
      redirect '/myhome'
      # flash success message?
    else
      redirect '/new_entry'
      # flash error?
    end
  end

end
