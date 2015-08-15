codeLocalObj = '''
contentObj = \'\'\'
if Meteor.isClient
  Template.elementCode.helpers
    'contentObj' : ->
      contentObj
\'\'\'
if Meteor.isClient
  Template.elementCode.helpers
    'contentObj' : ->
      contentObj
'''

if Meteor.isClient
  Template.elementCode.helpers
    'codeLocalObj' : ->
      codeLocalObj
