Defining a custom setter and getter (convenience attributes on models)
Since our Active Record models are still just Ruby classes, we can define our own setter and getter methods:

<%= form_for @post do |f| %>
  <%= f.label :category_name %>
  <%= f.text_field :category_name %>
  <%= f.text_field :content %>
  <%= f.submit %>
<% end %> 

`````````````````````````````````````````

# app/models/post.rb
class Post < ActiveRecord::Base
   def category_name=(name)
     self.category = Category.find_or_create_by(name: name)
   end

   def category_name
      self.category ? self.category.name : nil
   end
end 

# app/../post_controller.rb
class PostsController < ApplicationController
  def create
    Post.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:category_name, :content)
  end
end 