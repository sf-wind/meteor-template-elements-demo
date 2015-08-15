if Meteor.isClient
  hljs.configure
    tabReplace : '  '

if Meteor.isClient
  Template.header.helpers
    'header' : ->
      title : "Template Elements Demo"
      noBack : true
      isFixedWidth : true
      options : [
        {
          name : "Element"
          items : [
            {
              name : "Introduction"
              href : "#introduction"
            }
            {
              name : "Installation"
              href : "#install-package"
            }
            {
              name : "List"
              href : "#list"
            }
            {
              name : "Header"
              href : "#header"
            }
            {
              name : "Footer"
              href : "#footer"
            }
            {
              name : "Pagination"
              href : "#pagination"
            }
            {
              name : "Code"
              href : "#code"
            }
          ]
        }
      ]
