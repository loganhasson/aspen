# Aspen

A gem to instantly create your directory structure for a new Ruby project. More info on RubyGems.org: [Aspen](http://rubygems.org/gems/aspen).

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