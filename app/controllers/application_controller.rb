class ApplicationController < ActionController::Base

    private
    
    def current_user  
        if Tutor.find_by(id: session[:tutor_id])
            @current_user ||= Tutor.find_by(id: session[:tutor_id])  
        else
            @current_user ||= Student.find_by(id: session[:student_id])  
        end
    end

    def logout 
        session.clear
    end

end
