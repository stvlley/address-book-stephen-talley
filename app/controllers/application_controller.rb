class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    private
    
    def authenticate 
        if !current_user
          redirect_to signup_path, alert: "Invalid request"
        end
    end
    
    def login(user)
        session[:user_id] = user.id
    end

    def logout
        session[:user_id] = nil
    end 
end
