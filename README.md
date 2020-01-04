# Ruby on Rails Smart Home Web Interface application

## License

All source code is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

If you're on Arm, especially on Raspberry Pi Debian, you might also want to install a package: libffi-dev. It's reported [here](https://github.com/ffi/ffi/issues/697) that there is no warning on missing ffi dependencies, which will cause segmentfault when running rails commands.

```
$ bundle install --without production
```

Then install yarn:
```
$ yarn install --check-files
```
If you don't have yarn, install it following the official [website](https://yarnpkg.com/lang/en/docs/install/#mac-stable).

If you don't have node installed (which is reqired by yarn), you might want to install node as well, [official site](https://nodejs.org/en/download/current/).


Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```



* Ruby version: 2.7.0

* System dependencies: Linux MacOS

* Rails version: 6.0.2.1
