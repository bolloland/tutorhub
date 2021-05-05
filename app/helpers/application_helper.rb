module ApplicationHelper

    def tutor?
        @current_user.class == Tutor
    end

    
end
