def index
  @students = Student.all
end

INDEX(VIEW): 
<div>
  <% @students.each do |student| %>
    <div><%= link_to student.to_s, student_path(student) %></div>
  <% end %>
</div>
````````````````````````````````````````````````````````````
def show
  @song = Song.find_by_id(params[:id])
end

SHOW:
<h1><%= @song.name %></h1>

 WITH LINKS USING FOREIGN KEYS:
 <%= link_to @song.artist.name, artist_path(@song.artist) if @song.artist %>
 <%= link_to @song.genre.name, genre_path(@song.genre) if @song.genre %> 