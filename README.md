# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Schema visual representation:
![tables](https://user-images.githubusercontent.com/826189/130882963-df22e372-5e47-43d2-83e3-e0141d92482b.png)

# Iteration 1 -------------------------------

## CRUD

[R,M] done
#### User Story 1, Parent Index (x2)
For each parent table
As a visitor
When I visit '/parents'
Then I see the name of each parent record in the system


[R,M] done
#### User Story 2, Parent Show (x2)
As a visitor
When I visit '/parents/:id'
Then I see the parent with that id including the parent's attributes:
- data from each column that is on the parent table


[R,M] done
#### User Story 3, Child Index (x2)
As a visitor
When I visit '/child_table_name'
Then I see each Child in the system including the Child's attributes:


[R,M] done
#### User Story 4, Child Show (x2)
As a visitor
When I visit '/child_table_name/:id'
Then I see the child with that id including the child's attributes:


[R,M] done
#### User Story 5, Parent Children Index (x2)
As a visitor
When I visit '/parents/:parent_id/child_table_name'
Then I see each Child that is associated with that Parent with each Child's attributes:

## ActiveRecord


[R,M] done
#### User Story 6, Parent Index sorted by Most Recently Created (x2)
As a visitor
When I visit the parent index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created


[R,M] done
#### User Story 7, Parent Child Count (x2)
As a visitor
When I visit a parent's show page
I see a count of the number of children associated with this parent

## Usability


[R,M] done
#### User Story 8, Child Index Link
As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Child Index


[R,M] done
#### User Story 9, Parent Index Link
As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Parent Index


[R,M] done
#### User Story 10, Parent Child Index Link
As a visitor
When I visit a parent show page ('/parents/:id')
Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
Iteration 1 will be reviewed at your second check-in

# Iteration 2 ---------------------------------

## CRUD

[R,M] done
#### User Story 11, Parent Creation (x2)
As a visitor
When I visit the Parent Index page
Then I see a link to create a new Parent record, "New Parent"
When I click this link
Then I am taken to '/parents/new' where I  see a form for a new parent record
When I fill out the form with a new parent's attributes:
And I click the button "Create Parent" to submit the form
Then a `POST` request is sent to the '/parents' route,
a new parent record is created,
and I am redirected to the Parent Index page where I see the new Parent displayed.


[R,M] done
#### User Story 12, Parent Update (x2)
As a visitor
When I visit a parent show page
Then I see a link to update the parent "Update Parent"
When I click the link "Update Parent"
Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/parents/:id',
the parent's info is updated,
and I am redirected to the Parent's Show page where I see the parent's updated info


[R,M] done
#### User Story 13, Parent Child Creation (x2)
As a visitor
When I visit a Parent Childs Index page
Then I see a link to add a new adoptable child for that parent "Create Child"
When I click the link
I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
When I fill in the form with the child's attributes:
And I click the button "Create Child"
Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
a new child object/row is created for that parent,
and I am redirected to the Parent Childs Index page where I can see the new child listed


[R,] done
#### User Story 14, Child Update (x2)
As a visitor
When I visit a Child Show page
Then I see a link to update that Child "Update Child"
When I click the link
I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
When I click the button to submit the form "Update Child"
Then a `PATCH` request is sent to '/child_table_name/:id',
the child's data is updated,
and I am redirected to the Child Show page where I see the Child's updated information

## ActiveRecord


[ ] done
#### User Story 15, Child Index only shows `true` Records (x2)
As a visitor
When I visit the child index
Then I only see records where the boolean column is `true`


[ ] done
#### User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
As a visitor
When I visit the Parent's children Index Page
Then I see a link to sort children in alphabetical order
When I click on the link
I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

## Usability


[ ] done
#### User Story 17, Parent Update From Parent Index Page (x2)
As a visitor
When I visit the parent index page
Next to every parent, I see a link to edit that parent's info
When I click the link
I should be taken to that parents edit page where I can update its information just like in #### User Story 4


[ ] done
#### User Story 18, Child Update From Childs Index Page (x1)
As a visitor
When I visit the `child_table_name` index page or a parent `child_table_name` index page
Next to every child, I see a link to edit that child's info
When I click the link
I should be taken to that `child_table_name` edit page where I can update its information just like in #### User Story 11

# Iteration 3 ----------------------------

## CRUD

[ ] done
#### User Story 19, Parent Delete (x2)
As a visitor
When I visit a parent show page
Then I see a link to delete the parent
When I click the link "Delete Parent"
Then a 'DELETE' request is sent to '/parents/:id',
the parent is deleted, and all child records are deleted
and I am redirected to the parent index page where I no longer see this parent


[ ] done
#### User Story 20, Child Delete (x2)
As a visitor
When I visit a child show page
Then I see a link to delete the child "Delete Child"
When I click the link
Then a 'DELETE' request is sent to '/child_table_name/:id',
the child is deleted,
and I am redirected to the child index page where I no longer see this child

## ActiveRecord

[ ] done
#### User Story 21, Display Records Over a Given Threshold (x2)
As a visitor
When I visit the Parent's children Index Page
I see a form that allows me to input a number value
When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
Then I am brought back to the current index page with only the records that meet that threshold shown.

## Usability


[ ] done
#### User Story 22, Parent Delete From Parent Index Page (x1)
As a visitor
When I visit the parent index page
Next to every parent, I see a link to delete that parent
When I click the link
I am returned to the Parent Index Page where I no longer see that parent


[ ] done
#### User Story 23, Child Delete From Childs Index Page (x1)
As a visitor
When I visit the `child_table_name` index page or a parent `child_table_name` index page
Next to every child, I see a link to delete that child
When I click the link
I should be taken to the `child_table_name` index page where I no longer see that child

# Extensions --------------------------


[ ] done
Sort Parents by Number of Children (x2)

As a visitor
When I visit the Parents Index Page
Then I see a link to sort parents by the number of `child_table_name` they have
When I click on the link
I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name


[ ] done
Search by name (exact match)

As a visitor
When I visit an index page ('/parents') or ('/child_table_name')
Then I see a text box to filter results by keyword
When I type in a keyword that is an exact match of one or more of my records and press the Search button
Then I only see records that are an exact match returned on the page


[ ] done
Search by name (partial match)

As a visitor
When I visit an index page ('/parents') or ('/child_table_name')
Then I see a text box to filter results by keyword
When I type in a keyword that is an partial match of one or more of my records and press the Search button
Then I only see records that are an partial match returned on the page

This functionality should be separate from your exact match functionality.
