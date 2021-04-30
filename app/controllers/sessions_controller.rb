class SessionsController < ApplicationController
  

  def tutor_new #find the sessions in db
    # @tutor = Tutor.find_by(username: params[:session][:username])
  end

  def student_new
  end

  def tutor_create #attach the sessions to the user
    @tutor = Tutor.find_by(username: params[:session][:username])
      if @tutor && @tutor.authenticate(params[:session][:password])
        session[:tutor_id] = @tutor.id 
        current_user
        redirect_to tutor_path(@tutor)
      else
        render "tutor_new"
      end
  end

  def student_create #attach the sessions to the user
    @student = Student.find_by(username: params[:session][:username])
      if @student && @student.authenticate(params[:session][:password])
        session[:student_id] = @student.id 
        current_user
        redirect_to student_path(@student)
      else
        render "student_new"
      end
  end

  def tutor_destroy
    session.clear
  end

  def student_destroy
    session.clear
  end

  def tutor_params
    params.require(:tutor).permit(:id, :username, :password)
  end 
  
  def student_params
    params.require(:student).permit(:id, :username, :password)
  end 
end