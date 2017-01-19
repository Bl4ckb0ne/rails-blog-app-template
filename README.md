# rails-blog-app

## What is it?

Rails-blog-app is a simple blogging powered by rails, and using markdown to write articles

## Requirements

This app requires ruby 2.4.0, rails 5.0.1 and sqlite3

## Deployment

First, you'll have to change the credentials to the admin page in `app/controllers/admin_controller.rb`.
The username is in clear, and the password is a md5 hash of your chosen password.

Finally, start the app by launching `bin/rails server` and \

## Running the app

Simply start the app with `bin/rails server`. Then you can access the app on http://localhost:3000

## Routes

### Index

The index is the root of the app, accessible at http://localhost:3000/
It shows a list of articles. By default, there is 10 articles per pages, but you can change it in `app/controllers/articles_controller.rb`, in the function `index` 

### Article

The articles are accessible at http://localhost:3000/articles/[article_id]/

### Admin

To access the admin page, go to http://localhost:3000/admin, and enter your credentials. Then, you'll be able to write a new article and show, edit or destroy an existing article.

Articles are written in [Markdown](https://en.wikipedia.org/wiki/Markdown), and rendered [redcarpet](https://github.com/vmg/redcarpet).

## Todolist

- [ ] Enhance this README
- [ ] Improve the security of the Admin page
- [ ] Fix the markdown rendering for code
