angular-dev-box
===============

Provide a vagrant box to install dev dependencies for angular dependencies.

Usage
-----

    vagrant up
    vagrant ssh

You will have `npm`, `bower` and `yo` with `generator-angular` available on an
Ubuntu 14.04 LTS instance.

  - [Yeoman](https://github.com/yeoman/yeoman) - a set of tools for automating
  development workflow.
  - [npm](https://github.com/npm/npm) - a package manager for node.
  - [bower](https://github.com/bower/bower) - a package manager for the web.
  - [Grunt](https://github.com/gruntjs/grunt) - the javascript task runner.

Now use yeoman to create a new angular project!

<pre><code># Connect to the vm.
vagrant ssh
# Change directory to the share with your host ( laptop, dekstop ).
cd /vagrant
mkdir myproj
cd myproj
# Use yeoman to scaffold angular project.
yo angular
</code></pre>

Due to this [issue](https://github.com/yeoman/generator/issues/571), with bower
prompting for stats feedback during yeoman generation, you may see
the `yo angular` hang after execution of the command completes. Bower doesn't
consistently prompt so you may not experience the issue. If this issue does
occur, one possible workaround is to type `Ctrl`-`T`, stopping yeoman. Then try
running `bower cache clean` and the `yo angular` again. Quick note: calling
`yo angular` will prompt you repeatedly before replacing files its already
created, just answer yes to all.

<pre><code>
# Allow grunt to serve files to the lan (the one that connects with your laptop)
sed -i 's/localhost/0.0.0.0/' Gruntfile.js
# Start grunt serve task.
grunt serve --verbose
</code></pre>

*Please note*: The usage of the
[`--verbose`](http://gruntjs.com/using-the-cli#verbose-v) flag in the
`grunt serve` command are completely optional. If you are new to the
[grunt](http://gruntjs.com/) javascript task runner it might be helpful to view
the output for the purposes of gaining more insight into the process.

Connect to http://127.0.0.1:9000 and edit your project file with your favorite
IDE from your laptop. So that you have the host responsiveness for the file
edition process and isolation with dev tools running inside the VM.
