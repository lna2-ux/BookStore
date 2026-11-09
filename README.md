# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# BookStore - Ruby on Rails Project

A full-featured Book & Author Store web application built with Ruby on Rails, featuring dynamic data sourcing, advanced searching, hierarchical filtering, pagination, and a responsive Bootstrap UI.

## Features
- **External API Sourcing:** Populates database records dynamically using the public Open Library API.
- **Database Architecture:** One-to-many relationship (`Author` has many `books`).
- **Search & Filtering:** Text search for book titles and hierarchical dropdown filtering by author.
- **Pagination:** Clean, server-side pagination powered by the Kaminari gem.
- **Styling:** Fully responsive design styled with Bootstrap 5.

## Prerequisites & Setup
1. Ruby (version 3.x)
2. Rails (version 7.x or 8.x)
3. SQLite3

### Installation Steps
1. Clone the repository:
   ```bash
   git clone [https://github.com/lna2-ux/BookStore.git](https://github.com/lna2-ux/BookStore.git)
   cd BookStore