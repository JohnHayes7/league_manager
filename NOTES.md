NOTES
Would like to be able to do this:
Must create division class
Division has many teams
Team belong to a division
<% Division.all.each do |d| %>
    <h1> d.name </h1>
    <ul>
        <% d.teams.each do |t| %>
            <li><%= link_to t.name, t_path(t) %></l1>
        <% end %>
    </ul>
<% end %>