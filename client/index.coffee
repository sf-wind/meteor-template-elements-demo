if Meteor.isClient
  hljs.configure
    tabReplace : '  '

if Meteor.isClient
  Template.codeElementRemote.onRendered ->
    data = this.data
    if not data.id
      return
    template = this
    filename = data.id + ".txt"
    $.ajax
      url : '/code/' + filename
      success : (res)->
        div = template.find('pre#' + data.id)
        $(div).text(res)
        if not data.noHighlight
          hljs.highlightBlock(div)
      error : (err)->
        console.log err
    return

if Meteor.isClient
  Template.codeElementLocal.onRendered ->
    data = this.data
    if not data?.noHighlight
      div = this.find('pre')
      hljs.highlightBlock(div)

if Meteor.isClient
  Template.header.helpers
    'header' : ->
      title : "Template Elements Demo"
      noBack : true
      isFixedWidth : true

headerExampleObj = '''
header =
  isFloat : true                        # is the header fixed to the top?
  title : "Example Header"              # title of the header
  options : [                           # an array of options of the header
    {
      name : "Name"                     # option name
      "class" : "name-class"            # option class
      action : ->                       # action to take when clicking the option, if present
        Session.set("headerTest", "nameOnly")
    }
    {
      icon : "film"                     # option icon
      "class" : "icon-class"
      action : ->
        Session.set("headerTest", "iconOnly")
    }
    {
      icon : "key"                      # option icon, with a pull-down menu
      id : "id-icon"                    # option id
      items : [                         # pull-down menu list
        {
          id : "menu-id-1"              # pull-down menu item id
          icon : "flash"                # pull-down menu icon, if present
          name : "Item 1"               # pull-down menu item name
          action : ->
            Session.set("headerTest", "dropdownMenuItem")
        }
        {
          id : "menu-id-2"              # another pull-dowm menu item id
          icon : "leaf"                 # pull-down menu item icon
          name : "Item 2"               # pull-down menu item name
          href : "menu/2/href"          # pull-dwon menu item action, if present
        }
      ]
    }
    {
      name : "Drop down name"           # name of the pull-down menu
      items : [
        {
          name : "menu-name"            # one pull-down menu item
        }
      ]
    }
  ]'''

headerNoBackObj = '''
header =
  title : "Header without back"
  noBack : true
  isFloat : true
'''

headerWithOptionsObj = '''
header =
  title : "Header with options"
  isInline : true
  options : [
    {
      name : "Name"
      class : "name-class"
      href : "#header-options"
      action : (e, tmpl)->
        prevValue = Session.get("HeaderOptionsName")
        if not prevValue
          prevValue = 0
        Session.set('HeaderOptionsName', prevValue + 1)
    }
    {
      icon : "flash"
      class : "icon-class"
      href : "#header-options"
      action : (e, tmpl)->
        prevValue = Session.get("HeaderOptionsIcon")
        if not prevValue
          prevValue = 0
        Session.set('HeaderOptionsIcon', prevValue + 1)
        return false
    }
    {
      name : "Menu"
      class : "name-menu-class"
      items : [
        {
          name : "Item 1"
          class : "menu-item-1"
          href : "#header-options"
        }
        {
          icon : "anchor"
          name : "Item 2"
          class : "menu-item-2"
          href : "#header-options"
          action : (e, tmpl) ->
            prevValue = Session.get("HeaderOptionsNameMenuItem2")
            if not prevValue
              prevValue = 0
            Session.set('HeaderOptionsNameMenuItem2', prevValue + 1)
            return false
        }
      ]
    }
    {
      icon : "bicycle"
      class : "icon-menu-class"
      items : [
        {
          name : "Icon 1"
          class : "menu-icon-1"
          href : "#header-options"
        }
        {
          icon : "cab"
          name : "Icon 2"
          class : "menu-icon-2"
          action : (e, tmpl) ->
            prevValue = Session.get("HeaderOptionsIconMenuItem2")
            if not prevValue
              prevValue = 0
            Session.set('HeaderOptionsIconMenuItem2', prevValue + 1)
            return false
        }
      ]
    }
  ]
'''
if Meteor.isClient
  Template.elementHeader.onCreated ->
    instance = this
    instance.HeaderOptionsName = new ReactiveVar(0)
    instance.HeaderOptionsIcon = new ReactiveVar(0)
    instance.HeaderOptionsIconMenuItem2 = new ReactiveVar(0)
    instance.HeaderOptionsNameMenuItem2 = new ReactiveVar(0)
    return

  Template.elementHeader.helpers
    'headerExample' : ->
      header =
        isInline : true                        # is the header fixed to the top?
        title : "Example Header"              # title of the header
        options : [                           # an array of options of the header
          {
            name : "Name"                     # option name
            class : "name-class"              # option class
            action : ->                       # action to take when clicking the option, if present
              Session.set("headerTest", "nameOnly")
          }
          {
            icon : "film"                     # option icon
            "class" : "icon-class"
            action : ->
              Session.set("headerTest", "iconOnly")
          }
          {
            icon : "key"                      # option icon, with a pull-down menu
            id : "id-icon"                    # option id
            items : [                         # pull-down menu list
              {
                id : "menu-id-1"              # pull-down menu item id
                icon : "flash"                # pull-down menu icon, if present
                name : "Item 1"               # pull-down menu item name
                action : ->
                  Session.set("headerTest", "dropdownMenuItem")
                  return false
              }
              {
                id : "menu-id-2"              # another pull-dowm menu item id
                icon : "leaf"                 # pull-down menu item icon
                name : "Item 2"               # pull-down menu item name
                href : "#header-back"          # pull-dwon menu item action, if present
              }
            ]
          }
          {
            name : "Drop down name"           # name of the pull-down menu
            items : [
              {
                name : "menu-name"            # one pull-down menu item
              }
            ]
          }
        ]
      header
    'headerExampleObj' : ->
      return headerExampleObj
    'headerNoBack' : ->
      header =
        title : "Header without back"
        noBack : true
        isInline : true
      header
    'headerNoBackObj' : ->
      return headerNoBackObj
    'headerWithOptions' : ->
      header =
        title : "Header with options"
        isInline : true
        options : [
          {
            name : "Name"
            class : "name-class"
            href : "#header-options"
            action : (e, tmpl)->
              val = tmpl.HeaderOptionsName.get()
              tmpl.HeaderOptionsName.set(val+1)
              return false
          }
          {
            icon : "flash"
            class : "icon-class"
            href : "#header-options"
            action : (e, tmpl)->
              val = tmpl.HeaderOptionsIcon.get()
              tmpl.HeaderOptionsIcon.set(val+1)
              return false
          }
          {
            name : "Menu"
            class : "name-menu-class"
            items : [
              {
                name : "Item 1"
                class : "menu-item-1"
                href : "#header-options"
              }
              {
                icon : "anchor"
                name : "Item 2"
                class : "menu-item-2"
                href : "#header-options"
                action : (e, tmpl) ->
                  val = tmpl.HeaderOptionsNameMenuItem2.get()
                  tmpl.HeaderOptionsNameMenuItem2.set(val+1)
                  return false
              }
            ]
          }
          {
            icon : "bicycle"
            class : "icon-menu-class"
            items : [
              {
                name : "Icon 1"
                class : "menu-icon-1"
                href : "#header-options"
              }
              {
                icon : "cab"
                name : "Icon 2"
                class : "menu-icon-2"
                action : (e, tmpl) ->
                  val = tmpl.HeaderOptionsIconMenuItem2.get()
                  tmpl.HeaderOptionsIconMenuItem2.set(val+1)
                  return false
              }
            ]
          }
        ]
      header
    'headerWithOptionsObj' : ->
      return headerWithOptionsObj
    'HeaderOptionsName' : ->
      instance = Template.instance()
      instance.HeaderOptionsName.get()
    'HeaderOptionsIcon' : ->
      instance = Template.instance()
      instance.HeaderOptionsIcon.get()
    'HeaderOptionsNameMenuItem2' : ->
      instance = Template.instance()
      instance.HeaderOptionsNameMenuItem2.get()
    'HeaderOptionsIconMenuItem2' : ->
      instance = Template.instance()
      instance.HeaderOptionsIconMenuItem2.get()
