class TutorsController < ApplicationController
# before_action :get_tutor, only: [:show, :edit, :update, :delete]
before_action :current_tutor, except: [:new, :create]
before_action :get_tutor, except: [:index, :new, :create]
before_action :get_student, only: [:index, :show]

    def index
        @tutors = Tutor.all.alpha_by_subject_taught.order_by_years_exp

    end
   
    def new 
        @tutor = Tutor.new
    end

    def show

    end

    def create 
        @tutor = Tutor.new(tutor_params)
            if @tutor.save
                session[:tutor_id] = @tutor.id 
                @current_user = current_tutor
                redirect_to tutor_path(@tutor)
            else
                render :new 
        end
    end

    def edit 
    end

    def update 
            if @tutor.update(tutor_params)
                redirect_to tutor_path(@tutor)
            else
                render :edit
        end
    end

    def delete 
        @tutor.destroy
        redirect_to tutors_path
    end

    private
    
    def get_tutor
        @tutor = Tutor.find_by_id(params[:id])
    end
    
    def get_student
        @student = Student.find_by_id(params[:student_id])
    end
    
    def tutor_params
        params.require(:tutor).permit(:id, :first_name, :last_name, :email, :username, :password, :years_exp, :subject_taught, :tutor_bio)
    end
    
end

# def current_user  
    # @current_user ||= session[:current_user_id] && 
    # Tutor.find_by(id: session[:current_user_id])  
# end