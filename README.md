# Ferris
 [![Build Status](https://travis-ci.org/automation-wizards/ferris.svg?branch=master)](https://travis-ci.org/automation-wizards/ferris)
 [![Coverage Status](https://coveralls.io/repos/github/automation-wizards/ferris/badge.svg?branch=master)](https://coveralls.io/github/automation-wizards/ferris?branch=master)

## Synopsis

An opinionated testing framework built on top of Watir which provides massive power with minimal DSL. 

## Installation

Ensure that you have the most up to date version of chromedriver installed, this can be done using brew:

    $ brew update
    $ brew install chromedriver

Or you can download it directly here : https://sites.google.com/a/chromium.org/chromedriver/downloads

Add this line to your gemfile:

    gem 'ferris_watir'

And install it using:

    $ bundle install

To use this library in your code:

    require 'ferris'

## Running the demo specs in this repo

Clone this repo and cd into it.

Run:

    $ bundle install
    $ bundle exec rspec

Ferris should run a number of tests against wikipedia and you should see an output like this in your terminal:

        [Coveralls] Set up the SimpleCov formatter.
        [Coveralls] Using SimpleCov's default settings.
        
        Ferris::Core
          Text
            can call do
            can call do!
            do! is better than do
          Select List
            can call do
            can call do!
            do! is better than do
          Checkboxes
            can call do
            can call do!
            do! is better than do
          Radios
            can call do
            can call do!
            do! is better than do
        
        Ferris Element
          can call keyword
          can call do
          can call do!
          can locate from a region
          can locate from a page
        
        Ferris::Page
          is the correct object type
          can visit
          can retrieve its title
          can retrieve its url
        
        Ferris::Region
          is the correct object type
          can call exists?
          can call present?
          cannot call click
        
        Ferris::Site
          Compliance Site
            is the correct object type
            knows its base url
          Responsive Site
            is the correct object type
            knows its base url
          No URL Site
            should raise an error
        
        Finished in 9.4 seconds (files took 1.3 seconds to load)
        30 examples, 0 failures
