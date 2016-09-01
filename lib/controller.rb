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
    erb :index, layout: :layout_index
  end

  get '/register' do
    erb :register, layout: :layout_index
  end

  get '/myhome' do
    if env['warden'].authenticated?
      erb :myhome
    else
      flash[:error] = "You are not logged in"
      redirect '/'
    end
  end

  get '/fuckups' do
    if env['warden'].authenticated?
      @fuckup_results = Entry.all(user: env['warden'].user, :fuckups.not => nil)
      erb :fuckups
    else
      flash[:error] = "You are not logged in"
      redirect '/'
    end
  end

  get '/new_entry' do
    if env['warden'].authenticated?
      erb :new_entry, layout: :layout_entry
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

  get '/view-entry/:entry' do
    erb :view_entry, layout: :layout_entry
  end

  post '/' do
    @user = User.first(username: params[:user][:username])
    if @user != nil && @user.authenticate(params[:user][:password])
      if env['warden'].authenticate!
        binding.pry
        flash[:success] = "Successfully logged in"
        redirect '/myhome'
      end
    else
      flash[:error] = "You could not be logged in"
      redirect '/'
    end
  end

  post '/register' do

    if params[:user][:password] != params[:user][:password_check]
      flash[:error] = 'Passwords do not match.'
      redirect '/register'
    end
    if params[:user][:password].length < 5
      flash[:error] = 'Passwords must be greater than four characters.'
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
    @entry = Entry.new
    @entry.finished = params[:finished_projects]
    @entry.progress = params[:progress]
    @entry.languages = params[:languages]
    @entry.skillsets = params[:skillsets]
    @entry.woohoo = params[:woohoo]
    @entry.fuckups = params[:fuckups]
    @entry.notes = params[:notes]
    # @entry.user = @user ----> This is the line I want to work. @user should be the current, logged-in user. But to make my tests run, I'm using this:
    @entry.user = env['warden'].user
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

  get '/search' do
    keyword = params[:search_input]
    if env['warden'].authenticated?
      # @results = Entry.all.select do |entry|
      # finished?(entry, keyword) || notes?(entry, keyword)
      # end
      @results = Entry.all.select do |entry|
        matches_finished?(entry, keyword) ||
        matches_progress?(entry, keyword) ||
        matches_skillsets?(entry, keyword) ||
        matches_languages?(entry, keyword) ||
        matches_woohoo?(entry, keyword) ||
        matches_fuckups?(entry, keyword) ||
        matches_notes?(entry, keyword)

      end
      erb :search
    else
      flash[:error] = "You are not logged in"
      redirect '/'
    end
  end

  def matches_finished?(entry, keyword)
    if entry.finished.nil?
      false
    elsif (entry.finished.match keyword) == nil
      false
    else
      true
    end
  end

  def matches_progress?(entry, keyword)
    if entry.progress.nil?
      false
    elsif (entry.progress.match keyword) == nil
      false
    else
      true
    end
  end

  def matches_languages?(entry, keyword)
    if entry.languages.nil?
      false
    elsif (entry.languages.match keyword) == nil
      false
    else
      true
    end
  end

  def matches_fuckups?(entry, keyword)
    if entry.fuckups.nil?
      false
    elsif (entry.fuckups.match keyword) == nil
      false
    else
      true
    end
  end

  def matches_skillsets?(entry, keyword)
    if entry.skillsets.nil?
      false
    elsif (entry.skillsets.match keyword) == nil
      false
    else
      true
    end
  end

  def matches_woohoo?(entry, keyword)
    if entry.woohoo.nil?
      false
    elsif (entry.woohoo.match keyword) == nil
      false
    else
      true
    end
  end

  def matches_notes?(entry, keyword)
    if entry.notes.nil?
      false
    elsif (entry.notes.match keyword) == nil
      false
    else
      true
    end
  end

end
