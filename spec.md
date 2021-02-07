# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) Topic and User model has_many :lists
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)-  List model belongs_to :user and :topic
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) -Topic has_many :users through :lists; User has many :topics through :lists
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)- Topics has_many :users through :lists; Users has many :topics through :lists
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - List has the foreign keys being the join table while also have several attributes to submit as its the core function of web app- list has a topic_id and user_id, can also submit :title, :description, along with 10 list items.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - User: username unique, password length; Topic: name presence, uniqueness; List: at least 5 items present, title presence, description presence length max.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) topics index has topics sorted by most popular topics ie. topics with most lists ordered descending. (from topic with most lists to topic with least lists.)
- [x] Include signup (how e.g. Devise) simple users create and establish session on creation of user
- [x] Include login (how e.g. Devise) - login existing user with simple username password authentication and session establishment
- [x] Include logout (how e.g. Devise) - simple session clearing and redirect to root path
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
used omniauth and googleoauth2 to create User model and 'login' to website.
- [x] Include nested resource show or index (URL e.g. users/2/recipes)- /topics/:id/lists
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)-topics/:topic_id/lists/new from link in topic show page
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate