NEW.ERB.HTML:
<!-- app/views/posts/new.html.erb //-->

<% if @post.errors.any? %>
  <div id="error_explanation">
    <h2>
      <%= pluralize(@post.errors.count, "error") %>
      prohibited this post from being saved:
    </h2>

    <ul>
    <% @post.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
    </ul>
  </div>
<% end %> 



EDIT.ERB.HTML

<%= form_for @post do |f| %>
    <%= f.text_field :title %>
    <%= f.text_area :content %>
    <%= f.submit %>
  <% end %> 

???  <div class="field_with_errors">
  <input type="text" name="post[title]" id="post_title" value="Existing Post Title"/>
</div> 