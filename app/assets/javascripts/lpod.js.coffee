#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./states


# // LPOD.stateManager is useful for debugging,
# // but don't use it directly in application code.


# overall app
window.App = Ember.Application.create()

# specify the adapter for accessing with ember-data
App.store = DS.Store.create(
  adapter: DS.RESTAdapter.create(bulkCommit: false)
  revision: 4
)
