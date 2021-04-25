<h2>Create an Author</h2>
<%= form_tag authors_path, method: "post" do %>
  <% if @author.errors.any? %>
    <div id="error_explanation">
      <h2>There were some errors:</h2>
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
    <%= text_field_tag @author.email %>
  </div>

   <% if @author.errors[:phone_number].empty? %>
    <div class="field">
  <% else %>
    <div class="field_with_errors">
  <% end %>      
    <%= label_tag "phone_number", "Phone Number" %>
    <%= text_field_tag @author.phone_number %>
  </div>

  <%= submit_tag "Create" %>
<% end %>

````````````````````````````````````````````````````````````````
<%= form_tag("/people") do %>
    <% if @person.errors.any? %>
      <div id="error_explanation">
        <h2>There were some errors:</h2>
        <ul>
          <% @person.errors.full_messages.each do |message| %>
            <li><%= message %></li>
          <% end %>
        </ul>
      </div>
    <% end %>
  
  
    <div class="field<%= ' field_with_errors' if @person.errors[:name].any? %>">
      <%= label_tag "name", "Name" %>
      <%= text_field_tag "name", @person.name %>
    </div>
  
    <div class="field<%= ' field_with_errors' if @person.errors[:email].any? %>">
      <%= label_tag "email", "Email" %>
      <%= text_field_tag "email", @person.email %>
    </div>
  
    <%= submit_tag "Create" %>
  <% end %> 