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
