class StudentsController < ApplicationController
    # before_action :get_student, only: [:show, :edit, :update, :delete]
    before_action :current_student, except: [:new, :create]
    before_action :get_student, except: [:index, :new, :create]
    before_action :get_tutor, only: [:index, :show]
    # before_action :invalid_student?, only: [:edit, :show, :delete]

    def index
        @students = Student.all.order_by_grade
    end

    
    def new 
        @student = Student.new
    end
    
    def show
        # binding.pry 
        invalid_student
    end
    
    def create 
        @student = Student.new(student_params)
        if @student.save
            session[:student_id] = @student.id 
            @current_user = current_student
            redirect_to student_path(@student)
        else
            render :new 
        end
    end
    
    def edit 
    end
    
    def update 
        if @student.update(student_params)
            redirect_to student_path(@student)
        else
            render :edit
        end
    end
    
    def delete 
        @student.destroy
        redirect_to students_path
    end
    
    private
    
    def get_student
        @student = Student.find_by_id(params[:id])
    end
    
    def get_tutor
        @tutor = Tutor.find_by_id(params[:tutor_id])
    end
    
    def student_params
        params.require(:student).permit(:id, :first_name, :last_name, :email, :username, :password, :grade, :subject_help, :student_bio, :alpha_by_subject, :order_by_grade)
    end

    def invalid_student
        redirect_to student_path(@current_user.id) unless @current_user.class == Tutor || current_student.id == @student.id
    end
end

# if @current_user.class == Student 
#     if @student == nil || current_student.id != @student.id
#     redirect_to student_path, notice: "Sorry, you don't have permission to see that page."
# flash[:alert] = "Sorry, you don't have permission to see that page."
    #     end
    # end
    

# def current_user  
#     @current_user ||= session[:current_user_id] && 
#     Student.find_by(id: session[:current_user_id])  
# end
# def index_by_subject
#     @tutor = Tutor.find_by_id(params[:tutor_id])
#     @students = Student.all.alpha_by_subject
#     
# end

# def index_by_grade
#     @tutor = Tutor.find_by_id(params[:tutor_id])
#     @students = Student.all.order_by_grade
#     
# end