listExampleObj = '''
list =
  id : "id-of-the-list"                     # id for the list
  class : "class-of-the-list"               # class for the list
  action : (e, tmpl, $row, $a) ->           # action to trigger when
    val = tmpl.List.get()                   # no inner action is triggered
    tmpl.List.set(val+1)
    false                                   # do not propogate the click event up in the chain
  items : [
    {                                       # single component list item
      title : "First Item"                  # title field without class
      description : "First description"     # description field without class
      href : '#list-example'                # link
      id : 'id-for-first-item'              # id for the item
      action : (e, tmpl, $row, $a) ->       # action to take when clicked
        val = tmpl.ItemOne.get()
        tmpl.ItemOne.set(val+1)
        false
    }
    {                                       # single component list item
      title :                               # title object
        name : "Second Item"                # content of the title
        class : "second-item-title-class"   # class of the title
      description:                          # description object
        name : "Second description"         # content of the description
        class : "second-item-description-class"   # class of the description
      id : "second-item-id"                 # id of the item
      action : (e, tmpl, $row, $a) ->       # action to take when clicked
        val = tmpl.ItemTwo.get()
        tmpl.ItemTwo.set(val+1)
        false
      icons : [                             # list of icons to the right of the component
        {
          id : "icon-1-id"                  # id of the icon
          class : "icon-1-class"            # class of the icon
          icon : "flash"                    # fontawesome icon
          href : "#list-example"            # link of the icon
        }
        {
          id : "icon-2-id"                  # id of the icon
          class : "icon-2-class"            # class of the icon
          icon : "bank"                     # fontawesome icon
          action : (e, tmpl, $row, $a)->    # action to take when clicked
            val = tmpl.IconTwo.get()
            tmpl.IconTwo.set(val+1)
            false
        }
      ]
    }
    {                                       # multiple component list item
      class : "third-item-class"            # class for the list item
      action : (e, tmpl)->                  # action to take when the item
        val = tmpl.ItemThree.get()          # is clicked, and no inner action
        tmpl.ItemThree.set(val+1)           # is defined
        false
      cells : [                             # an array of horizontal components
        {
          class : "icon-cell-class"         # class for one component
          icons : [                         # the component only contains
            {                               # icons.
              id : "first-icon"             # id for the icon
              class : "first-icon-class"    # class for the icon
              icon : "car"                  # fontawesome icon
              action : (e, tmpl, $row, $a)->    # action to take when the icon is clicked
                val = tmpl.ItemThreeIconOne.get()
                tmpl.ItemThreeIconOne.set(val+1)
                false
            }
            {
              id : "second-icon"            # id for the icon
              class : "second-icon-class"   # class for the icon
              icon : "camera"               # fontawesome icon
            }                               # no action is defined, the
          ]                                 # item action is triggered when clicked
        }
        {
          title :
            name : "Cell One"               # title of one horizontal component
            class : 'cell-one-title-class'  # class of the title
          class : "first-cell-class"        # class of the component
        }                                   # no description is defined
        {
          title : "Cell Two"                # title of one horizontal component
          description : "Cell two description" # description
          action : (e, tmpl, $row, $a)->    # action to trigger when clicked
            val = tmpl.ItemThreeCellTwo.get()
            tmpl.ItemThreeCellTwo.set(val+1)
            false
        }
        {                                   # icon only component
          icons : [
            {
              class : "third-icon-class"
              icon : "clock-o"
              href : "#list-example"
            }
            {
              class : "fourth-icon-class"
              icon : "desktop"
            }
          ]
        }
      ]
    }
    {
      title : "Item Four"
    }
  ]
'''

if Meteor.isClient
  Template.elementList.onCreated ->
    instance = this
    instance.ItemOne = new ReactiveVar(0)
    instance.ItemTwo = new ReactiveVar(0)
    instance.IconTwo = new ReactiveVar(0)
    instance.ItemThree = new ReactiveVar(0)
    instance.ItemThreeIconOne = new ReactiveVar(0)
    instance.ItemThreeCellTwo = new ReactiveVar(0)
    instance.List = new ReactiveVar(0)
  Template.elementList.helpers
    'listExample' : ->
      list =
        id : "id-of-the-list"                     # id for the list
        class : "class-of-the-list"               # class for the list
        action : (e, tmpl, $row, $a) ->           # action to trigger when
          val = tmpl.List.get()                   # no inner action is triggered
          tmpl.List.set(val+1)
          false                                   # do not propogate the click event up in the chain
        items : [
          {                                       # single component list item
            title : "First Item"                  # title field without class
            description : "First description"     # description field without class
            href : '#list-example'                # link
            id : 'id-for-first-item'              # id for the item
            action : (e, tmpl, $row, $a) ->                 # action to take when clicked
              val = tmpl.ItemOne.get()
              tmpl.ItemOne.set(val+1)
              false
          }
          {                                       # single component list item
            title :                               # title object
              name : "Second Item"                # content of the title
              class : "second-item-title-class"   # class of the title
            description:                          # description object
              name : "Second description"         # content of the description
              class : "second-item-description-class"   # class of the description
            id : "second-item-id"                 # id of the item
            action : (e, tmpl, $row, $a) ->       # action to take when clicked
              val = tmpl.ItemTwo.get()
              tmpl.ItemTwo.set(val+1)
              false
            icons : [                             # list of icons to the right of the component
              {
                id : "icon-1-id"                  # id of the icon
                class : "icon-1-class"            # class of the icon
                icon : "flash"                    # fontawesome icon
                href : "#list-example"            # link of the icon
              }
              {
                id : "icon-2-id"                  # id of the icon
                class : "icon-2-class"            # class of the icon
                icon : "bank"                     # fontawesome icon
                action : (e, tmpl, $row, $a)->    # action to take when clicked
                  val = tmpl.IconTwo.get()
                  tmpl.IconTwo.set(val+1)
                  false
              }
            ]
          }
          {                                       # multiple component list item
            class : "third-item-class"            # class for the list item
            action : (e, tmpl, $row, $a)->        # action to take when the item
              val = tmpl.ItemThree.get()          # is clicked, and no inner action
              tmpl.ItemThree.set(val+1)           # is defined
              false
            cells : [                             # an array of horizontal components
              {
                class : "icon-cell-class"         # class for one component
                icons : [                         # the component only contains
                  {                               # icons.
                    id : "first-icon"             # id for the icon
                    class : "first-icon-class"    # class for the icon
                    icon : "car"                  # fontawesome icon
                    action : (e, tmpl, $row, $a)->    # action to take when the icon is clicked
                      val = tmpl.ItemThreeIconOne.get()
                      tmpl.ItemThreeIconOne.set(val+1)
                      false
                  }
                  {
                    id : "second-icon"            # id for the icon
                    class : "second-icon-class"   # class for the icon
                    icon : "camera"               # fontawesome icon
                  }                               # no action is defined, the
                ]                                 # item action is triggered when clicked
              }
              {
                title :
                  name : "Cell One"               # title of one horizontal component
                  class : 'cell-one-title-class'  # class of the title
                class : "first-cell-class"        # class of the component
              }                                   # no description is defined
              {
                title : "Cell Two"                # title of one horizontal component
                description : "Cell two description" # description
                action : (e, tmpl, $row, $a)->    # action to trigger when clicked
                  val = tmpl.ItemThreeCellTwo.get()
                  tmpl.ItemThreeCellTwo.set(val+1)
                  false
              }
              {                                   # icon only component
                icons : [
                  {
                    class : "third-icon-class"
                    icon : "clock-o"
                    href : "#list-example"
                  }
                  {
                    class : "fourth-icon-class"
                    icon : "desktop"
                  }
                ]
              }
            ]
          }
          {
            title : "Item Four"
          }
        ]
    'listExampleObj' : ->
      return listExampleObj
    'ItemOne' : ->
      instance = Template.instance()
      instance.ItemOne.get()
    'ItemTwo' : ->
      instance = Template.instance()
      instance.ItemTwo.get()
    'IconTwo' : ->
      instance = Template.instance()
      instance.IconTwo.get()
    'ItemThreeIconOne' : ->
      instance = Template.instance()
      instance.ItemThreeIconOne.get()
    'ItemThreeCellTwo' : ->
      instance = Template.instance()
      instance.ItemThreeCellTwo.get()
    'ItemThree' : ->
      instance = Template.instance()
      instance.ItemThree.get()
    'List' : ->
      instance = Template.instance()
      instance.List.get()
