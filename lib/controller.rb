require 'bundler'
Bundler.require
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }
require_relative 'helpers/data_mapper'
# require_relative 'helpers/warden'
require 'pry'

class AmberNote < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  def create_amber_user
    if User.count == 0
      @user = User.new(username: "amber", password: "amber")
      @user.save
    end
  end

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
    create_amber_user
    @user = User.first(username: params[:user][:username])
    if @user != nil && @user.authenticate(params[:user][:password])
      flash[:success] = "Successfully logged in"
      redirect '/myhome'
    else
      flash[:error] = "You could not be logged in"
      redirect '/'
    end
  end

  post '/new_entry' do
    ## Test user that will have to be removed when I get registration working
    # Need this here for testing because we don't go through the home page...
    create_amber_user
    @entry = Entry.new
    @entry.finished = params[:finished_projects]
    # @entry.user = @user ----> This is the line I want to work. @user should be the current, logged-in user. But to make my tests run, I'm using this:
    @entry.user = User.first
    if @entry.save
      redirect '/myhome'
      # flash success message?
    else
      redirect '/new_entry'
      # flash error?
    end
  end

end
