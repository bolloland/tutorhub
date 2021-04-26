class TutorsController < ApplicationController
before_action :get_tutor, only: [:show, :edit, :update, :delete]

    def index
        @tutors = Tutor.all
    end
   
    def new 
        @tutor = Tutor.new
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
        @tutor.destroy
        redirect_to tutors_path
    end

    private

    def get_tutor
        @tutor = Tutor.find_by_id(params[:id])
    end


    def tutor_params
        params.require(:tutor)
    end
    
end
