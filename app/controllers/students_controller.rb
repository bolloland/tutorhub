class StudentsController < ApplicationController
    # before_action :get_student, only: [:show, :edit, :update, :delete]

    def index
        @tutor = Tutor.find_by_id(params[:tutor_id])
        @students = Student.all
        binding.pry
    end
   
    def new 
        @student = Student.new
    end

    def show
        @tutor = Tutor.find_by_id(params[:tutor_id])
        @student = Student.find_by_id(params[:id])
    end
    
    def create 
        @student = Student.new(student_params)
            if @student.save
                redirect_to student_path(@student)
            else
                render :new 
            end
    end

    def edit 
        @student = Student.find_by_id(params[:id])
    end

    def update 
        @student = Student.find_by_id(params[:id])
        if @student.update(student_params)
            redirect_to student_path(@student)
        else
            render :edit
        end
    end

    def delete 
        @student = Student.find_by_id(params[:id])
        @student.destroy
        redirect_to students_path
    end

    private
    
    # def current_user  
    #     @current_user ||= session[:current_user_id] && 
    #     Student.find_by(id: session[:current_user_id])  
    # end

    def get_student
        @student = Student.find_by_id(params[:id])
    end

    def student_params
    params.require(:student).permit(:id, :first_name, :last_name, :email, :username, :password, :grade, :subject_help, :student_bio)
    end
    
end
