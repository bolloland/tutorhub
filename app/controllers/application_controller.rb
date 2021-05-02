class ApplicationController < ActionController::Base

    
    def current_user  
        if Tutor.find_by(id: session[:tutor_id])
            @current_user ||= Tutor.find_by(id: session[:tutor_id])  
        else
            @current_user ||= Student.find_by(id: session[:student_id])  
        end
    end

    # def current_user
    #     current_tutor.exists? ? current_tutor : current_student
    # end

    def current_tutor
        if Tutor.find_by(id: session[:tutor_id])
            @current_user ||= Tutor.find_by(id: session[:tutor_id]) 
        end
    end

    def current_student
        if Student.find_by(id: session[:student_id])
        @current_user ||= Student.find_by(id: session[:student_id])
        end
    end

    def logout 
        session.clear
    end

end
 