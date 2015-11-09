Meteor.startup ->
  roles = (Roles.getAllRoles().map (r) -> r.name)
  unless 'client' in roles
    Roles.createRole 'client'
