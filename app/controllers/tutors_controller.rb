class TutorsController < ApplicationController
# before_action :get_tutor, only: [:show, :edit, :update, :delete]

    def index
        @tutors = Tutor.all
    end
   
    def new 
        @tutor = Tutor.new
    end

    def show
        @tutor = Tutor.find_by_id(params[:id])
    end

    def create 
        @tutor = Tutor.new(tutor_params)
            if @tutor.save
                redirect_to tutor_path(@tutor)
            else
                render :new 
        end
    end

    def edit 
        @tutor = Tutor.find_by_id(params[:id])
    end

    def update 
        @tutor = Tutor.find_by_id(params[:id])
            if @tutor.update(tutor_params)
                redirect_to tutor_path(@tutor)
            else
                render :edit
        end
    end

    def delete 
        @tutor = Tutor.find_by_id(params[:id])
        @tutor.destroy
        redirect_to tutors_path
    end

    private
    
    # def current_user  
        # @current_user ||= session[:current_user_id] && 
        # Tutor.find_by(id: session[:current_user_id])  
    # end

    def get_tutor
        @tutor = Tutor.find_by_id(params[:id])
    end

    def tutor_params
        params.require(:tutor).permit(:id, :first_name, :last_name, :email, :username, :password, :years_exp, :subject_taught, :tutor_bio)
    end
    
end
