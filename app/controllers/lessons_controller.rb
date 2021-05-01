class LessonsController < ApplicationController
    before_action :current_user
    def index
        @tutor = Tutor.find_by_id(params[:tutor_id])
        @student = Student.find_by_id(params[:student_id])
        @lessons = Lesson.all
    end

    def show
        @tutor = Tutor.find_by_id(params[:tutor_id])
        @student = Student.find_by_id(params[:student_id])
        @lesson = Lesson.find_by_id(params[:id])
       
    end

    def new 
        @tutor = Tutor.find_by_id(params[:tutor_id])
        @student = Student.find_by_id(params[:student_id])
        @lesson = Lesson.new
        # binding.pry
    end

    def create 
        # binding.pry
        @tutor = Tutor.find_by_id(params[:lesson][:tutor_id])
        @student = Student.find_by_id(params[:lesson][:student_id])
        @lesson = Lesson.new(lesson_params)
            if @lesson.save
                if @current_user.class == Tutor
                    redirect_to tutor_student_lesson_path(@tutor, @student, @lesson)
                else
                    redirect_to student_tutor_lesson_path(@student, @tutor, @lesson)
                end
            else
              render :new 
            end
    end

    def edit 
        @lesson = Lesson.find_by_id(params[:id])
    end

    def update 
        @lesson = Lesson.find_by_id(params[:id])
        if @lesson.update(lesson_params)
            redirect_to lesson_path(@lesson)
        else
            render :edit
        end
    end

    def delete 
        @lesson = Lesson.find_by_id(params[:id])
        @lesson.destroy
        redirect_to lessons_path
    end

    private

    def get_lesson
L     @lesson = Lesson.find_by_id(params[:id])
L end

    def lesson_params
        params.require(:lesson).permit(:tutor_id, :student_id, :location, :address_1, :address_2, :meeting_time, :subject, :topic)
    end
    
end
