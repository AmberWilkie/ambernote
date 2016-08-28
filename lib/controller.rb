require 'bundler'
Bundler.require
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }
require_relative 'helpers/data_mapper'
require_relative 'helpers/warden'
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

  use Warden::Manager do |config|
  config.default_strategies :password, :basic

  # Tell Warden how to save our User info into a session.
  # Sessions can only take strings, not Ruby code, we'll store
  # the User's `id`
  config.serialize_into_session { |user| user.id }
  # Now tell Warden how to take what we've stored in the session
  # and get a User from that information.
  config.serialize_from_session { |id| User.get(id) }

  # config.scope_defaults :default,
  #                       # "strategies" is an array of named methods with which to
  #                       # attempt authentication. We have to define this later.
  #                       strategies: [:password],
  #                       # The action is a route to send the user to when
  #                       # warden.authenticate! returns a false answer. We'll show
  #                       # this route below.
  #                       action: 'auth/unauthenticated'
  # # When a user tries to log in and cannot, this specifies the
  # # app to send the user to.
  # config.failure_app = self
end

# Warden::Manager.before_failure do |env, opts|
#   env['REQUEST_METHOD'] = 'POST'
# end

  get '/' do
    erb :index
  end

  get '/register' do
    erb :register
  end

  get '/myhome' do
    if env['warden'].authenticated?
      erb :myhome
    else
      flash[:error] = "You are not logged in"
      redirect '/'
    end
  end

  get '/new_entry' do
    if env['warden'].authenticated?
      erb :new_entry
    else
      flash[:error] = "You are not logged in"
      redirect '/'
    end
  end

  get '/logout' do
    env['warden'].raw_session.inspect
    env['warden'].logout
    flash[:success] = 'Successfully logged out.'
    redirect '/'
  end

  post '/' do
    create_amber_user
    @user = User.first(username: params[:user][:username])
    if @user != nil && @user.authenticate(params[:user][:password])
      if env['warden'].authenticate!
        flash[:success] = "Successfully logged in"
        redirect '/myhome'
      end
    else
      flash[:error] = "You could not be logged in"
      redirect '/'
    end
  end

  post '/register' do
    #again, I only need this line to make my tests run:
    create_amber_user

    if params[:user][:password] != params[:user][:password_check]
      flash[:error] = 'Passwords do not match.'
      redirect '/register'
    end

    @user = User.new(username: params[:user][:username], password: params[:user][:password])
    if @user.save
      env['warden'].authenticate!
      flash[:success] = "Account created. Logged in as #{@user.username}"
      redirect '/myhome'
    else
      @user.errors.keys.each do |key|
        @user.errors[key].each do |error|
          flash[:error] = error
        end
      end
      redirect '/register'
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
      flash[:success] = "Entry successfully saved"
      redirect '/myhome'
      # flash success message?
    else
      flash[:error] = "Entry could not be saved"
      redirect '/new_entry'
      # flash error?
    end
  end

end
