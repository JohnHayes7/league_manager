# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Season has_many Competitions) 
- [x] Include at least one belongs_to relationship (Player belongs_to Team)
- [X] Include at least two has_many through relationships (Season has_many Matches through competitions, Coach has_many Matches through Teams)
- [X] Include at least one many-to-many relationship (Competition has_many Teams through Matches, Teams has_many competitions through Matches)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (Matches have date, time, notes and stats)
- [x] Include reasonable validations for simple model objects (location, competition, player, season, referee, Coach)
- [x] Include a class level ActiveRecord scope method (competition#standings Team.order(:wins) /standings)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (competition/:id/match/:id)
- [x] Include nested resource "new" form (URL e.g. competition/:id/matches/new)
- [x] Include form display of validation errors (locations/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [x] Views use partials if appropriate