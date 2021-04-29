class SessionsController < ApplicationController
  
  def tutor_welcome
  end

  def tutor_new #find the sessions in db
   
    # @tutor = Tutor.find_by(username: params[:session][:username])
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
      binding.pry
  end

  def tutor_destroy
  end

  def tutor_params
    params.require(:tutor).permit(:id, :username, :password)
  end   
end
