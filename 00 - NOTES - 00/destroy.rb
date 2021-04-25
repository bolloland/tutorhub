# app/controllers/people_controller.rb

def destroy
    Person.find(params[:id]).destroy
    redirect_to people_url
  end 


  As shown, you have to go to a user's show page to delete them. 
  What if we want an admin control panel where users can be deleted from a list?

<!-- app/views/people/index.html.erb //-->

<% @people.each do |person| %>
<div class="person">
  <span><%= person.name %></span>
  <%= link_to "Delete", person, method: :delete, data: { confirm: "Really?" } %>

 == OR ==
 
 <%= button_to "Delete Image", image_path(@image), method: :delete %> 
 
 </div>
<% end %> 