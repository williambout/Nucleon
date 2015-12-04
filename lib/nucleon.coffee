module.exports =
  config:
    light:
      type: 'boolean'
      default: false
      description: 'Optimized color for light themes'
    tabPaneIcon:
      type: 'boolean'
      default: true
      description: 'Icons on tab pane'

  activate: (state) ->
    atom.config.onDidChange 'nucleon.light', ({newValue, oldValue}) =>
      @light newValue
    @light atom.config.get 'nucleon.light'

    atom.config.onDidChange 'nucleon.tabPaneIcon', ({newValue, oldValue}) =>
      @tabPaneIcon newValue
    @tabPaneIcon atom.config.get 'nucleon.tabPaneIcon'
    # console.log 'activate'

  deactivate: ->
    # console.log 'deactivate'

  serialize: ->
    # console.log 'serialize'

  light: (enable) ->
    body = document.querySelector 'body'
    if enable
      body.className = "#{body.className} nucleon-light"
    else
      body.className = body.className.replace /\snucleon-light/, ''


  tabPaneIcon: (enable) ->
    body = document.querySelector 'body'
    className = body.className
    if enable
      body.className = "#{className} nucleon-tab-pane-icon"
    else
      body.className = className.replace /\snucleon-tab-pane-icon/, ''
