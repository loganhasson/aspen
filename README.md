# aspen

A gem to instantly create your directory structure for a new Ruby project. More info on RubyGems.org: [aspen](http://rubygems.org/gems/aspen).

###Installation:

```bash
$ gem install aspen
```

Creates basic project directory structure including rspec initialization. Also creates
skeleton README.md and evnironment.rb files.

###Usage:

```bash
$ aspen <project_title>
```

###CURRENTLY BROKEN, WOOPS
```bash
$ aspen --help
```

###Example:

```bash
$ aspen awesome new project
mkdir -p awesome-new-project
mkdir -p awesome-new-project/lib/models
mkdir -p awesome-new-project/lib/concerns
mkdir -p awesome-new-project/bin
mkdir -p awesome-new-project/config
  create   spec/spec_helper.rb
  create   .rspec
Project successfully created at: /Users/matthewcampbell/Sites/code/labs/awesome-new-project
```

###Contributing:

Tell us what you think! You're awesome and so are your opinions :)

If you have suggestions on how to improve the gem, [drop us a line](mailto:teamevalruby@gmail.com) or submit a pull request to the GitHub repo.

###Known Issues:

* Prints "Invalid Command" even if the gem has worked

* --help flag looks for a file that doesn't exist

* Will only install rspec via:

```bash
$ gem install aspen
```

###Upcoming Features:

* Flags to customize directory structure

* Github/git repo creation via flag

* Model.rb and Template.erb file creation

Built with ♥ <a href="https://twitter.com/flatironschool">@flatironschool</a>
