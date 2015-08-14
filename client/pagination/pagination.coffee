paginationExampleObj = '''
pagination =                  # the pagination object
  total : 100                 # total number of items
  page_number : page          # current page ID, obtained from a ReactiveVar
  items_per_page : 10         # number of items per page
  num_pager : 5               # number of pagers to display
  getHREF : (idx) ->          # the page to go to when clicked
    return '#page-' + idx
  action : (e, tmpl, idx) ->  # the action to take when clicked
    tmpl.PageID.set(idx)
    false                     # return false, the URL is short cut
'''

if Meteor.isClient
  Template.elementPagination.onCreated ->
    instance = this
    instance.PageID = new ReactiveVar(1)
  Template.elementPagination.helpers
    'pagination' : ->
      template = Template.instance()
      page = template.PageID.get()  # get the current page ID
      pagination =                  # the pagination object
        total : 100                 # total number of items
        page_number : page          # current page ID, obtained from a ReactiveVar
        items_per_page : 10         # number of items per page
        num_pager : 5               # number of pagers to display
        getHREF : (idx) ->          # the page to go to when clicked
          return '#page-' + idx
        action : (e, tmpl, idx) ->  # the action to take when clicked
          tmpl.PageID.set(idx)
          false                     # return false, the URL is short cut
      pagination
    'paginationExampleObj' : ->
      paginationExampleObj
