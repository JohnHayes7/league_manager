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

/team/matches = schedule
Only show one teams matches

ADMIN OPTIONS
@admin.options = ["Administrator", "Coach", "Season", "Competition", "Player", "Referee", "Team", "Location", "Matches"]

<%= form_for (@admin) do |f| %>
    <%= f.label "Would You like to create a new...>
    <%= f.collection_select @admin.options, :blank => true %>
    <%= f.submit %>
<% end %>

*****NEED A CURRENT SEASON METHOD******
*****NEED ADMINISTRATOR TO BE ABLE TO SET THE CURRENT SEASONS*****
*****NEED CURRENT USER *****
*****NEED LOGGED IN? *****
*****NEED TO ADD TIME TO MATCH****
*****NEED TO CHANGE DATE TYPE FROM STRING TO :DATE*****

