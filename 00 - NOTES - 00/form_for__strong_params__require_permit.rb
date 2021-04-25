<h3>Post Form</h3>

<%= form_for(@post) do |f| %>
  <label>Post title:</label><br>  
     OR <%= f.label 'Post Title:' %>
  <%= f.text_field :title %><br>

  <label>Post description</label><br>
     OR <%= f.description 'Post Title:' %>
  <%= f.text_area :description %><br>

  <%= f.submit %>
<% end %> 

form_for uses PATCH    a change from form_tag uses PUT 

# config/routes.rb
resources :posts, only: [:index, :show, :new, :create, :edit, :update] 
patch 'posts/:id', to: 'posts#update' 

# controller action for #create and #update
#  ~~~ STRONG PARAMS ~~~
# DEF CREATE...
WAS @post.create(title: params[:title], description: params[:description])
NEW @post = Post.create(params.require(:post).permit(:title, :description)) 

# DEF UPDATE...
WAS @post.update(title: params[:title], description: params[:description])
NEW @post = Post.update(params.require(:post).permit(:title, :description)) 

ex:
def update
   @post = Post.find(params[:id])
   @post.update(params.require(:post).permit(:title, :description)) 
   redirect_to post_path(@post)
 end