# aspen

A gem to instantly create your directory structure for a new Ruby project. More info on RubyGems.org: [aspen](http://rubygems.org/gems/aspen).

###Installation:

```bash
$ gem install aspen
```

Creates basic project directory structure including rspec initialization. Also creates
skeleton README.md and evnironment.rb files.

###Basic Usage:

```bash
$ aspen -n <project_title>
```

```bash
$ aspen --help
```

###Example Bash Output:

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
<td><code>-n<br />--name=NAME</code></td>
<td>Flag to designate the name of your new project. Must come before any other flags.</td>
<td><code>$ aspen -n my-awesome-project<br />$ aspen --new another-project</code></td>
</tr>

<tr>
<td><code>-t<br />--template=TEMPLATE</code></td>
<td>Flag to designate the tempalte for your project's directory structure. If left blank uses default aspen template.</td>
<td><code>$ aspen -n my-awesome-project -t hello</td>
</tr>

<tr>
<td><code>-g<br />--git</code></td>
<td>Flag to designate auto-initialize your git repo locally.</td>
<td><code>$ aspen -n my-awesome-project -g<br />$ aspen -n another-project -gt hello</code></td>
</tr>

</tbody>

</table>

###Contributing:

Tell us what you think! You're awesome and so are your opinions :)

If you have suggestions on how to improve the gem, [drop us a line](mailto:teamevalruby@gmail.com) or submit a pull request to the GitHub repo.

###Known Issues:

* Will only install rspec via:

```bash
$ gem install aspen
```

###Upcoming Features:

* Flags to customize directory structure

* Github/git repo creation via flag

* Model.rb and Template.erb file creation

Built with ♥ <a href="https://twitter.com/flatironschool">@flatironschool</a>
