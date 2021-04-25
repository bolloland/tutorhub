CONTROLLER: 

def edit
  @student = Student.find_by_id(params[:id])
end

def update 
  @author = Author.find(params[:id])
  if @author.update(author_params)
    redirect_to author_path(@author)
  else
    render :edit
  end
end
# def update
#   @student = Student.find_by_id(params[:id])
#   @student.update(student_params) 
#   redirect_to student_path(@student)
# end

private

def student_params
  params.require(:student).permit(:first_name, :last_name)
end

VIEW:
<h1>EDIT SCHOOL CLASSES</h1>

<%= form_for(@student) do |f| %>

    <%= f.label :first_name %>
    <%= f.text_field :first_name %>

    <%= f.label :last_name %>
    <%= f.text_field :last_name %>

    <%= f.submit %>
<% end %> 



# def edit
#     @article = Article.find_by_id(params[:id])
#   end

#   def update
#     @article = Article.find(params[:id])
#     @article.update(title: params[:article][:title], description: params[:article][:description])
#     redirect_to article_path(@article) #show page
#   end 

VIEWS: 

#edit.html.erb
# will auto-fill info from @article instance into form. User makes corrections and persists data to db. 

<%= form_for(@article) do |f| %>
    <%= f.label 'Article Title' %><br>
    <%= f.text_field :title %><br>
  
    <%= f.label 'Article Description' %><br>
    <%= f.text_area :description %><br>
  
    <%= f.submit "Submit Article" %>
  <% end %>

  