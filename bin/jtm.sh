# author: lencx
#!/usr/bin/env bash

dart ./bin/jtm.dart
flutter packages pub run build_runner build --delete-conflicting-outputs