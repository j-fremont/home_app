# home_app

A new Flutter project.

## Configuration

```
$ export PATH=$PATH:~/flutter/bin
```

Si flutter doctor prend trop de temps, Faire :
```
$ flutter doctor
...
Checking Android licenses is taking an unexpectedly long time...
...
~/Android/Sdk/tools/bin/sdkmanager --licenses --proxy=http --proxy_host=vip-users.proxy.edf.fr --proxy_port=3128
```

Et/ou forcer la localisation du SDK.
```
$ flutter config --android-studio-dir=""
$ flutter config --android-sdk=""
$ flutter config --android-studio-dir='/home/j75550/android-studio'
$ flutter config --android-sdk='/home/j75550/Android/Sdk'
```

Dans Android Studio, File/Settings/Plugin chercher Flutter et installer/redémarrer.

Si WebSocketException, faire, et redémarrer SDK si besoin :
```
$ flutter run
...
WebSocketException: Connection to 'http://127.0.0.1:6001/chats/5#' was not upgraded to websocket
...
$ export NO_PROXY=localhost,127.0.0.1,10.0.2.2
```

## Nouveau projet

Créer un nouveau projet.
```
$ flutter create nom_projet
[mon_projet]$ flutter run
No supported devices connected.
...
$ flutter devices
No devices detected.
```

Installer un émulateur dans le SDK/AVD. Pas possible de lancer un émulateur en même temps qu'une VM : https://unix.stackexchange.com/questions/149416/run-avd-and-virtualbox-at-the-same-time

Lancer un device.
```
$ flutter emulators
1 available emulator:
Pixel_XL_API_30 • Pixel XL API 30 • Google • android
...
$ flutter emulators --launch Pixel_XL_API_30
...
$ flutter devices
1 connected device:
sdk gphone x86 arm (mobile) • emulator-5554 • android-x86 • Android 11 (API 30) (emulator)
...
[mon_projet]$ flutter run
...
```

## Installer un package

Ajouter des dependencies dans pubspec.yaml.

Puis.
```
$ flutter packages get
```

## Lancer le projet

```
[mon_projet]$ flutter run
```





### Pour mettre l'appareil en mode développeur

https://developer.android.com/studio/debug/dev-options

Paramètres, rechercher "à propoos", cliquer 7 fois sur "numéro de build". Paramètres, rechercher "développeur", cocher "Débogage USB". Brancher l'appareil sur le portable. Puis :

```
$ flutter devices
...
QGTW85WCFM7DZL8P (mobile) • QGTW85WCFM7DZL8P • android-arm • Android null (API null)
```

Mettre l'utilisateur dans le group plugdev : https://developer.android.com/studio/run/device

```
$ sudo usermod -aG plugdev j75550
```
