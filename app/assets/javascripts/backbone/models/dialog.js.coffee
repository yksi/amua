class Amua.Models.Dialog extends Backbone.Model
  paramRoot: 'dialog'

  defaults:

class Amua.Collections.DialogsCollection extends Backbone.Collection
  model: Amua.Models.Dialog
  url: '/dialogs'
