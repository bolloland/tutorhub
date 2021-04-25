class PostsController < ApplicationController

	def create
		@student = Student.new(student_params) 
		@student.save
		redirect_to student_path(@student)
	  end

	def update
		@student = Student.update(student_params) 
		redirect_to student_path(@student)
	end

	private

	def student_params
		params.require(:student).permit(:first_name, :last_name)
	end
	###################  
	*ARGS
	private

	def post_params(*args)   ###
		params.require(:post).permit(*args)   ###
	end

	#Because they require slight;y different arguments - we include them ALL, but filter them in the creat/update methods
	i.e. @post = Post.new(post_params(:title, :description))
end
	#   def update
	# 	@post = Post.find(params[:id])
	# 	@post.update(post_params(:title))  ######
	# 	redirect_to post_path(@post)
	#   end 

	# def edit
	#   @post = Post.find(params[:id])
	# end
