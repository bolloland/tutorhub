MIGRATIONS:
add new column called "published_status"
$ rails g migration add_published_status_to_posts published_status:string --no-test-framework 
#                  ^^what                  ^^where        how^^
$ rails g migration remove_published_status_from_posts published_status:string --no-test-framework

rails g migration add_post_status_to_posts post_status:boolean --no-test-framework 

**check file before you migrate - you may have to edit/add/remove data before you persist to db

MODELS:
App: Author (<<!! singular!!), Columns:, name, bio, genre 
rails g model Author name:string genre:string bio:text --no-test-framework 


CONTROLLER:
# Controller generators are great if you are creating static views or non-CRUD related features
rails g controller admin dashboard stats financials settings --no-test-framework 
          #controller^       ^yield routes and views for all 4 generator arguments + index (/admin)

RESOURCE:
# If you are building an API, using a front end MVC framework, 
# or simply want to manually create your views, 
# the resource generator is a great option for creating the code. 
rails g resource Account name:string payment_status:string --no-test-framework 
creates: migration file, controller, view directory (no html.erb), full resource call in routes.rb , helper page, coffee & css 
