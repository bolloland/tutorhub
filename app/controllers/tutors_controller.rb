class TutorsController < ApplicationController
before_action :get_tutor, only: [:show, :edit, :update, :delete]

    def index
        @tutors = Tutor.all
    end

    def show
    end

    def new 
        @tutor = Tutor.new
    end

    def create 
    end

    def edit 
    end

    def update 
    end

    def delete 
    end

    private

    def get_tutor
    
    end


    def tutor_params
    end
    
end
