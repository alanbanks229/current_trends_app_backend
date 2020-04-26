class ApplicationController < ActionController::Base
    # command prevents Rails from using its authenticity token. 
    # This is a security token that Rails generates from our session data 
    # and adds to the parameters sent from a Rails form to a controller action 
    # to prevent cross-site request forgery (CSRF) attacks. 
    # Since we are treating our back-end as an API, we should disable this so that 
    # we don’t receive ‘forbidden’ parameters that will prevent our controller actions from executing without errors.
    skip_before_action :verify_authenticity_token


    #this makes sure the methods defined below will be passed to all controllers in the app.
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!

    def login!
        session[:user_id] = @user.id
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorized_user?
        @user == current_user
    end

    def logout!
        session.clear
    end
end