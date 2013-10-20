# aspen

A Ruby gem to easily, flexibly, and instantly create your next project's directory structure. Aspen, get it? Like a tree. With roots.

Anyway, for more details, check out the usage examples below.

More info on RubyGems.org: [aspen](http://rubygems.org/gems/aspen).

###Installation:

```bash
$ gem install aspen
```

###Basic Usage:

```bash
$ aspen <project_title>
```

Creates basic project directory structure including rspec initialization. Also creates skeleton README.md and evnironment.rb files.

```bash
$ aspen --help
```

Displays help.

###Example Bash Output:

```bash
$ aspen my-awesome-project
mkdir -p my-awesome-project
mkdir -p my-awesome-project/bin
mkdir -p my-awesome-project/config
mkdir -p my-awesome-project/lib/models
mkdir -p my-awesome-project/lib/concerns
  create   spec/spec_helper.rb
  create   .rspec
 
Project successfully created at:
	/Users/matthewcampbell/Sites/code/labs/my-awesome-project
```
####Default Created Directory Structure:

```bash
my-awesome-project
├── README.md
├── bin
├── config
│   └── environment.rb
├── lib
│   ├── concerns
│   └── models
└── spec
    └── spec_helper.rb
```

###Better Usage:

<table>
<thead><tr>

<th>Flag</th>
<th>Purpose</th>
<th>Example</th>
</tr></thead>

<tbody>

<tr>
<td><code>-t<br />--template=TEMPLATE</code></td>
<td>Flag to designate the template for your project's directory structure. If left blank uses default aspen template.</td>
<td><code>$ aspen -t hello my-awesome-project</td>
</tr>

<tr>
<td><code>-g<br />--git</code></td>
<td>Flag to designate auto-initialize your git repo locally.</td>
<td><code>$ aspen -g my-awesome-project<br />$ aspen -gt hello another-project</code></td>
</tr>

</tbody>

</table>

###Contributing:

aspen is only as strong as the community surrounding it - like a forest.

Because aspen is a type of tree.

Anyway, we need your help: aside from improving the code base and adding new features, please submit templates of your own. It's really easy to create them, and with a single pull request you can help the forest grow. 

All aspen needs to create a new directory template is a hash. As an example, the default aspen template is structured as follows in ```templates/default.rb```:

```ruby
TEMPLATE = {
              :bin => {},
              :config => {},
              :lib => {
                :models => {},
                :concerns => {}
              }
            }
```
All directories within your project are represented as key-value pairs. Directories with no children will point to an empty hash. Subdirectories will be nested within as hashes of their own.  

Your template must be submitted as a ```.rb``` file in the ```templates``` directory and follow reasonable naming conventions. In other words, no weird characters or spaces. If you really want to be sure, here's more [info](http://www.exadox.com/en/articles/file-naming-convention-ten-rules-best-practice). 

####Submit Code, Offer Suggestions, Be Heard.

Tell us what you think! You're awesome and so are your opinions :)

If you have suggestions on how to improve the gem, [drop us a line](mailto:teamevalruby@gmail.com) or submit a pull request.

And Twitter is always cool:

[@loganhasson](https://www.twitter.com/loganhasson)

[@mecampbellsoup](https://www.twitter.com/mecampbellsoup)

[@j_scag_](https://www.twitter.com/j_scag_)

###Known Issues:

* Please submit a GitHub Issue with any bugs or concerns you encounter.

###Upcoming Features:

* More flags to customize directory structure

* GitHub remote repo creation via flag

* Custom file creation

* Submit anything else you'd like to see via a GitHub Issue - or, better yet, submit a pull request :) 

Built with ♥ <a href="https://twitter.com/flatironschool">@flatironschool</a>