<h1> New Artist: </h1>

<h1><%= @artist.name %></h1>
<p><%= @artist.bio %></p>

<% @artist.songs.each do |s| %>
<p><%= link_to s.name, song_path(s) if s %></p>
<% end %>

<%# <%= link_to "Edit Artist", edit_artist_path(@artist) %> 

# @artist has multiple songs, song belongs_to artist.
# s = @artist.song