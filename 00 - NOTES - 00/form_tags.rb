

FORM TAGS:
!!new

<h2>Create an Author</h2>
<%= form_tag authors_path, method: "post" do %>
  <% if @author.errors.any? %>
    <div id="error_explanation">
      <h3>There were some errors:</h3>
      <ul>
        <% @author.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
  <% if @author.errors[:name].empty? %>
    <div class="field">
  <% else %>
    <div class="field_with_errors">
  <% end %>
    <%= label_tag "name", "Name" %>
    <%= text_field_tag "name", @author.name %>
  </div>

  <% if @author.errors[:email].empty? %>
    <div class="field">
  <% else %>
    <div class="field_with_errors">
  <% end %>
    <%= label_tag "email", "Email" %>
    <%= text_field_tag "email", @author.email %>
  </div>

  <% if @author.errors[:phone_number].empty? %>
    <div class="field">
  <% else %>
    <div class="field_with_errors">
  <% end %>
    <%= label_tag "phone_number", "Phone Number" %>
    <%= text_field_tag "phone_number", @author.phone_number %>
  </div>

  <%= submit_tag "Create" %>
<% end %>
````````````````````````````````````````````````````````````````````
EDIT!!

<h2>Editing "<%= @post.title %>"</h2>
<%= form_tag post_path(@post), method: "patch" do %>
  <% if @post.errors.any? %>
      <div id="error_explanation">
        <h3>There were some errors:</h3>
        <ul>
          <% @post.errors.full_messages.each do |message| %>
            <li><%= message %></li>
          <% end %>
        </ul>
      </div>
  <% end %>

  <% if @post.errors[:title].empty? %>
    <div class="field">
  <% else %>
    <div class="field_with_errors">
  <% end %>
    <%= label_tag "title", "Title" %>
    <%= text_field_tag "title", @post.title %>
  </div>


 <% if @post.errors[:category].empty? %>
    <div class="field">
  <% else %>
    <div class="field_with_errors">
  <% end %>
    <%= label_tag "category", "Category" %>
     <p>Must be either "Fiction" or "Non-Fiction".</p>  
    <%= text_field_tag "category", @post.category %>
     <p>
      Please type carefully as our top scientists are working around the clock to
      enable state-of-the-art dropdown technology for this form field.
    </p>
  </div>

 <% if @post.errors[:content].empty? %>
    <div class="field">
  <% else %>
    <div class="field_with_errors">
  <% end %>
    <%= label_tag "content", "Content" %>
    <%= text_area_tag "content", @post.content %>
  </div>

  <%= submit_tag "Update" %>
<% end %>
````````````````````````````````````````````````````````````````



<!-- app/views/people/new.html.erb //-->

<%= form_tag "/people" do %>
  Name: <%= text_field_tag "name", @person.name %><br>
  Email: <%= text_field_tag "email", @person.email %>
  <%= submit_tag "Create Person" %>
<% end %> 

````````````````````````````````````````````````````````
<%= form_tag posts_path do %>

  <label>Post Title:</label><br>
  <%= text_field_tag :'post[title]' %><br>

  <label>Post description:</label><br>
  <%= text_area_tag :'post[description]' %><br>

  <%= submit_tag "Submit Post" %>
  
<% end %> 

<%= params.inspect %>