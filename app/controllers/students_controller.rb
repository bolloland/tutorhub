class StudentsController < ApplicationController
    before_action :get_student, only: [:show, :edit, :update, :delete]

    def index
        @students = Student.all
    end
   
    def new 
        @student = Student.new
    end

    def show
    end

    def create 
    end

    def edit 
    end

    def update 
    end

    def delete 
        @student.destroy
        redirect_to students_path
    end

    private

    def get_student
        @student = Student.find_by_id(params[:id])
    end


    def tutor_params
        params.require(:tutor)
    end
    
end
