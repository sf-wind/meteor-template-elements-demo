
footerExampleObj = '''
footer =
  id : "footer-id"                    # id of the footer
  class : "footer-class"              # class of the footer
  isInline : true                     # is the footer inline or fixed at the bottom?
  items : [                           # footer items
    {
      class : "item-1-class"          # class of one item
      active : true                   # item is active
      icon : "thumbs-o-up"            # icon of the item, if exists
      label : "UP"                    # label of the item, if exists
      href : '#footer-example'        # url to go to when clicked
    }
    {
      class : "item-2-class"
      icon : "thumbs-o-down"
      label : "DOWN"
      action : (e, tmpl)->            # action to take when clicked
        val = tmpl.FooterItem2.get()
        tmpl.FooterItem2.set(val+1)
        false
    }
    {
      class : "item-3-class"
      icon : "tag"
      label : "TAG"
      href : "#footer-example"        # url to go to when clicked
      action : (e, tmpl) ->
        val = tmpl.FooterItem3.get()
        tmpl.FooterItem3.set(val+1)  # after action is performed, the url is fetched
    }
  ]
'''
if Meteor.isClient
  Template.elementFooter.onCreated ->
    instance = this
    instance.FooterItem2 = new ReactiveVar(0)
    instance.FooterItem3 = new ReactiveVar(0)
    instance.showFixed = new ReactiveVar(false)
  Template.elementFooter.helpers
    'footerExample' : ->
      footer =
        id : "footer-id"                    # id of the footer
        class : "footer-class"              # class of the footer
        isInline : true                     # is the footer inline or fixed at the bottom?
        items : [                           # footer items
          {
            id : "item-1-id"                # id of one item
            class : "item-1-class"          # class of one item
            active : true                   # item is active
            icon : "thumbs-o-up"            # icon of the item, if exists
            label : "UP"                    # label of the item, if exists
            href : '#footer-example'        # url to go to when clicked
          }
          {
            class : "item-2-class"
            icon : "thumbs-o-down"
            label : "DOWN"
            action : (e, tmpl)->            # action to take when clicked
              val = tmpl.FooterItem2.get()
              tmpl.FooterItem2.set(val+1)
              false
          }
          {
            class : "item-3-class"
            icon : "tag"
            label : "TAG"
            href : "#footer-example"        # url to go to when clicked
            action : (e, tmpl) ->
              val = tmpl.FooterItem3.get()
              tmpl.FooterItem3.set(val+1)  # after action is performed, the url is fetched
          }
        ]
    'showFixed' : ->
      tmpl = Template.instance()
      tmpl.showFixed.get()

    'footerFixed' : ->
      footer =
        class : "footer-class"              # class of the footer
        isFixedWidth : true
        items : [                           # footer items
          {
            class : "item-1-class"          # class of one item
            active : true                   # item is active
            icon : "thumbs-o-up"            # icon of the item, if exists
            label : "UP"                    # label of the item, if exists
            href : '#footer-inline-or-fixed'        # url to go to when clicked
          }
          {
            class : "item-2-class"
            icon : "thumbs-o-down"
            label : "DOWN"
            action : (e, tmpl)->            # action to take when clicked
              val = tmpl.FooterItem2.get()
              tmpl.FooterItem2.set(val+1)
              false
          }
          {
            class : "item-3-class"
            icon : "tag"
            label : "TAG"
            href : "#footer-inline-or-fixed"        # url to go to when clicked
            action : (e, tmpl) ->
              val = tmpl.FooterItem3.get()
              tmpl.FooterItem3.set(val+1)  # after action is performed, the url is fetched
          }
        ]
    'footerExampleObj' : ->
      footerExampleObj
    'FooterItem2' : ->
      instance = Template.instance()
      instance.FooterItem2.get()
    'FooterItem3' : ->
      instance = Template.instance()
      instance.FooterItem3.get()

  Template.elementFooter.events
    'click .footer-toggle-fixed' : (e, tmpl)->
      val = tmpl.showFixed.get()
      tmpl.showFixed.set(not val)
      false
