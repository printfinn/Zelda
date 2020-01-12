# Ruby on Rails Smart Home Web Interface application

## License

All source code is available jointly under the MIT License and the Beerware License.

## What it does

You have a lot of smart devices, you want to control them but not with Big Brothers watching you, this is a web server you can set up on your raspberry pi (or whatever Linux that can run Ruby on Rails) and control your devices through.

To use this:

0. How this works: you give this site a script which can simulate the control of your smart device. It runs the script for you when you hit the buttons in the control center of this site.

1. You need to figure out how to control your smart device first by your self, write the command to simulate this procedure in whatever language you like and put the code in a single .py file or .sh file or .c .rb .rs file, then put them on any machine you like.

2. Sign up a user, create a device in the web page.

3. When creating the new device, fill the file in step 1 in the On Command / Off Command form, it will be called by this site as if you are running it in the shell. For example, your file is at "/User/Bob/scripts/Turn_On.py", then you should fill the form like "python /User/bob/scripts/Turn_On.py" (don't put the quotes, just write the command as if you are writing them in the shell).

4. In the `device_type` field, if you fill it with any of "Camera, Alarm, Light, Gate", it will have a different appearance in the web page.

5. If you are using a camera, this app loads the photo generated in the folder `/public/assets/images/captured.jpg`.

6. If the script file is on another machine, you might want to ssh to it, make sure to pass your public ssh keyfile to that remote machine so you don't have to input your password while calling the script with ssh through this site.

7. Don't write 'sudo rm -rf' kind of commands or other commands you don't understand, they will harm your system.

## Getting started


If you're on Arm, especially on Raspberry Pi Debian, you might also want to install a package: `libffi-dev`. It's reported [here](https://github.com/ffi/ffi/issues/697) that there is no warning on missing ffi dependencies, which will cause segmentfault when running rails commands.

To get started with the app, clone the repo and then install the needed gems:


```
$ bundle install
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

## Screen Shot

* Responsive Design
* Desktop frontpage
![front page desktop](https://user-images.githubusercontent.com/10386624/72062149-2a47d500-3312-11ea-8a5d-7e945eb329ab.png)

* Single Tap Control Center
![Control Center](https://user-images.githubusercontent.com/10386624/72143610-f633e900-33d1-11ea-9f78-dcc9a9a11c4c.png)

* Mobile frontpage with dropdown
![front page mobile](https://user-images.githubusercontent.com/10386624/72062151-2a47d500-3312-11ea-81da-b3c62cfd4fe0.png)

* Devices list
![devices list](https://user-images.githubusercontent.com/10386624/72062152-2ae06b80-3312-11ea-99ae-866c7f138f15.png)
![create a device](https://user-images.githubusercontent.com/10386624/72062153-2ae06b80-3312-11ea-940e-447b78c7e59e.png)

* User management with Devise gem
![user register](https://user-images.githubusercontent.com/10386624/72062154-2ae06b80-3312-11ea-93a6-35242036f91e.png)

## TODO:
* [Stability] Write test cases.
* [DevOps] CI | CD.
* [New Feature] Schedule triggers to run periodically with calendar interface.
* [Software engineering] Write documentations.
* [Translate] I18n
* [Feature] Admin privilege for creating and update devices.