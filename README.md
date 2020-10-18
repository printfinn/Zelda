# Zelda: A cloud free smart home web interface

## What it does

You have a lot of smart devices, you want to control them but not with Big Brothers watching you, this is a web server you can set up on your raspberry pi (or whatever Linux that can run Ruby on Rails) and control your devices through.

To use this:

0. How this works: you give this site a script which can simulate the control of your smart device. It runs the script for you when you hit the buttons in the control center of this site.

1. You need to figure out how to control your smart device first by your self, write the command to simulate this procedure in whatever language you like and put the code in a single .py file or .sh file or .c .rb .rs file, then put them on any machine you like.

2. Sign up a user, use your rails console to check the activation link and paste it to browser.

3. Create a device in the web page, when creating the new device, fill the file in step 1 in the On Command / Off Command form, it will be called by this site as if you are running it in the shell. For example, your file is at "/User/Bob/scripts/Turn_On.py", then you should fill the form like "python /User/bob/scripts/Turn_On.py" (don't put the quotes, just write the command as if you are writing them in the shell).

4. In the `device_type` field, if you fill it with any of "Camera, Alarm, Light, Gate", it will have a different appearance in the web page.

5. If you are using a camera, this app loads the photo generated in the folder `/public/assets/images/captured.jpg`.

6. If the script file is on another machine, you might want to ssh to it, make sure to pass your public ssh keyfile to that remote machine so you don't have to input your password while calling the script with ssh through this site.

7. Don't write 'sudo rm -rf' kind of commands or other commands you don't understand, they will harm your system.

## I18n Supports
Zelda supports Chinese and English now.

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



* Ruby version: 2.7.2

* System dependencies: Linux MacOS

* Rails version: 6.0.3.4

## Screen Shot

* Responsive Design
* Desktop frontpage
<img src="https://user-images.githubusercontent.com/10386624/72062149-2a47d500-3312-11ea-8a5d-7e945eb329ab.png" alt="front page desktop" width="640x"/>

* Single Tap Control Center
<img src="https://user-images.githubusercontent.com/10386624/72250945-c4bc5700-3637-11ea-8a94-e165a7d9cec7.png" alt="Control Center" width="640x"/>

* Mobile frontpage with dropdown
<img src="https://user-images.githubusercontent.com/10386624/72062151-2a47d500-3312-11ea-81da-b3c62cfd4fe0.png" alt="front page mobile" width="320x"/>

* Devices list
<img src="https://user-images.githubusercontent.com/10386624/72062152-2ae06b80-3312-11ea-99ae-866c7f138f15.png" alt="devices list" width="320x"/>

<img src="https://user-images.githubusercontent.com/10386624/72062153-2ae06b80-3312-11ea-940e-447b78c7e59e.png" alt="create a device" width="320x"/>

* User management with Devise gem
<img src="https://user-images.githubusercontent.com/10386624/72062154-2ae06b80-3312-11ea-93a6-35242036f91e.png" alt="user register" width="320x"/>


## Bonus:
If you ever want to run it on a raspberry pi, here is a systemd config you can use (with rbenv):

```
[Unit]
Description=Smart Garage Rails Service
After=syslog.target

[Service]
ExecStart=/home/pi/.rbenv/bin/rbenv exec bundle exec rails server -b 0.0.0.0
WorkingDirectory=/home/pi/smart-garage-rails
StandardOutput=inherit
StandardError=inherit
Restart=always
User=pi

[Install]
WantedBy=multi-user.target
```

## TODO:
* [Stability] Write test cases.
* [DevOps] CI | CD.
* [New Feature] Schedule triggers to run periodically with calendar interface.
* [Software engineering] Write documentations.
* [Feature] Admin privilege for creating and update devices.


## License

MIT
