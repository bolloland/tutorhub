class SessionsController < ApplicationController
  

  def tutor_new #tutor-Login form rendered
    @tutor = Tutor.new
  end
  
  def student_new
    @student = Student.new
     #attach the sessions to the user
  end

  def tutor_omniauth
   
    @tutor = Tutor.from_omniauth(request.env['omniauth.auth'])
      if @tutor.valid?
        session[:tutor_id] = @tutor.id
        current_tutor
        redirect_to tutor_path(@tutor)
      else
        render new_tutor_path
      end
  end  
    
  
  def tutor_create
    @tutor = Tutor.find_by(username: params[:session][:username])
    if @tutor && @tutor.authenticate(params[:session][:password])
      session[:tutor_id] = @tutor.id 
      current_tutor
      redirect_to tutor_path(@tutor)
    else
      redirect_to new_tutor_path      
    end
  end
  
  def student_create #attach the sessions to the user
    @student = Student.find_by(username: params[:session][:username])
    if @student && @student.authenticate(params[:session][:password])
      session[:student_id] = @student.id 
      current_student
      redirect_to student_path(@student)
    else
      render "student_new"
    end
  end
  
  def tutor_destroy
    session.clear
    redirect_to root_path
  end
  
  def student_destroy
    session.clear
    redirect_to root_path
  end
  
  def tutor_params
    params.require(:tutor).permit(:id, :username, :password)
  end 
  
  def student_params
    params.require(:student).permit(:id, :username, :password)
  end 
end


 # def student_omniauth
 #   @student = Student.from_omniauth(request.env['omniauth.auth'])
 #   if @student.valid?
 #     session[:student_id] = student.id
 #     current_student
 #     redirect_to student_path(@student)
 #   else
 #     render "student_new"
 #   end
 # end