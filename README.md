## Objectives

For this challenge, you'll be adding some new functionality to a very basic Sinatra+ActiveRecord application. The application in its current form includes:

- a `User` model (along with sign-in and sign-up functionality)
- a `Skill` model (representing a skill that a user might have)

Your task is to add the notion of "proficiency" to the application. A user can have many skills, and a skill can belong to many users. A "proficiency" is an association between `User`s and `Skill`s, and has the following additional *required* attributes:

- years of experience
- a flag tracking whether or not the user has formal education for the given skill

You'll need to provide an interface in the application for users to select the skills that they have. How you choose to provide this interface is up to you, but a user should only be able to edit her own skills, not the skills of other users.

Also, the home page of your application should simply show each user, along with each of her skills, how many years experience she has with said skill, and whether or not she's been formally educated in that skill. For example:

<table>
  <tr>
    <th>Name</th><th>Skill</th><th>Years</th><th>Formal?</th>
  </tr>
  <tr class="new-user">
    <td>Marie Curie</td><td>Ruby (technical)</td><td>1</td><td>yes</td>
  </tr>
  <tr>
    <td></td><td>JavaScript (technical)</td><td>2</td><td>yes</td>
  </tr>
  <tr class="new-user">
    <td>Max Born</td><td>Illustrator (creative)</td><td>5</td><td>no</td>
  </tr>
  <tr>
    <td></td><td>CSS (technical)</td><td>3</td><td>no</td>
  </tr>
</table>

## Important
**Please run `rake db:drop` before you begin to flush any old databases**

## Useful Notes / Tidbits

- What's the [right kind of association](http://guides.rubyonrails.org/association_basics.html#the-has_many-through-association) between `User` and `Skill`?
- Validations on boolean fields [can be tricky](http://stackoverflow.com/questions/10506575/rails-database-defaults-and-model-validation-for-boolean-fields).
- Before implementing a manual way to add new proficiencies for a user, you might try adding some through your `seeds.rb` file.
