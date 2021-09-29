# What to learn

https://www.youtube.com/watch?v=F3JuuYuOUK4&t=1171s

`$ dart create -t console-full dart_basic`

## Available dart project templates
* console-simple: A simple command-line application. (default)
* console-full: A command-line application sample.
* package-simple: A starting point for Dart libraries or applications.
* server-shelf: A server app using `package:shelf`
* web-simple: A web app that uses only core Dart libraries.

## create a .vscode/launch.json
select a dart file
press f5
vscode will create a new launch.json in .vscode folder
specify how to run the project
press ctrl + space in json structure and vscode will list up available properties
```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "dart_basic",
            "request": "launch",
            "type": "dart",
            "program": "bin/dart_basic.dart", <--- path of the dart file with `main()`
            "args": [ <-- Optionally, you can also specify command line arguments
                "1",
                "2",
                "3",
                "4"
            ]
        }
    ]
}
```



Dart dev tool for dart/flutter
Install dart dev tool for advanced debugging
`$ dart pub global activate devtools`
ctrl + P --> Dart: Open DevTools

Web browser --> http://127.0.0.1:9100/#/?

Run `$ dart run --observe --pause-isolates-on-start`

Get the listening url like `http://127.0.0.1:8181/A_jVEeGWRXc=/` from the output of dart run and paste into http://127.0.0.1:9100/#/?

## Available compilers
  aot-snapshot   Compile Dart to an AOT snapshot.
  exe            Compile Dart to a self-contained executable.
  jit-snapshot   Compile Dart to a JIT snapshot.
  js             Compile Dart to JavaScript.
  kernel         Compile Dart to a kernel snapshot.

## Development phase vs Production phase
Use jit for development -> debug, hot reload
Use aot for production -> fast, no debugging

## Dart vm can execute dart apps in 2 ways
  - from source code by using jit/aot compiler
  - from snapshots(jit, aot or kernel snapshots)

$ dart compile kernel .\bin\dart_basic.dart --> CFE(Common Front End) converts this to kernel binary(*.dill, intermediary dart language).
Compiling .\bin\dart_basic.dart to kernel file .\bin\dart_basic.dill.
Info: Compiling with sound null safety

$ dart compile exe .\bin\dart_basic.dart --> CFE(Common Front End) --> .dill -> TFA(Type Flow Analysis) --> .dill --> dart_basic.exe is created

snapshot = serialized Heap, so it can immediately run it
* aot-snapshot: 
* jit-snapshot: grep snapshot by doling training run
* kernel

$ dart compile jit-snapshot .\bin\dart_basic.dart
Compiling .\bin\dart_basic.dart to jit-snapshot file .\bin\dart_basic.jit.
Info: Compiling with sound null safety
Hello world: 42!
Args sum: 0

$ dart compile aot-snapshot .\bin\dart_basic.dart
Generated: c:\users\lucas.kim\documents\development\projects\dart-flutter-study\dart_basic\bin\dart_basic.aot
How to run aot-snapshot: $ dartaotruntime ./bin/dart_basic.aot

## Dart package
Dart package = directory containing, at minimum, a pubspec.yaml file

4 types of dependencies
* immediate dependencies: directly referenced in pubspec.yml of this dart app
* transitive dependencies: dependencies of the immediate dependencies
* regular dependencies: used for development and production phase
* dev dependencies: used only for development phase

semantic versioning
* caret syntax: ^8.0.1, same with >=8.0.1<9.0.0
* traditional syntax: >=8.0.1<9.0.0

## Local package
### Share pubspec.lock when working on local package
Once `dart pub get` finishes, `pubspec.lock` file is generated from pubspec.yaml and it has depencies with exact version.
So, if you're working on local package that is not going to be published to pub.dev, it's recommended to include `pubspec.lock` when commiting to source code repository(git, svn).

## It's possible to push to alternative package server.

## Instead of published package, it's possible to use git repository as a dependency.
dependencies:
  local_package:
    git: 
      url: https://github.com/local_package.git
      ref: master

## Path packages
When required packages are in different direcotyr inside the same source code repository, it's possible to refer them.
path of package should start from root directory of your package.

dependencies:
  local_package_a:
    path: /packages/package_a
  local_package_b:
    path: /packages/package_b
  local_package_c:
    path: /packages/package_c

## sdk packages, at the moment, flutter is only sdk package.
dependencies:
  flutter_driver:
    sdk: flutter
    version: ^0.0.1

Once packages are downloaded, they are stored in local cache directory
* Windows: %LOCALAPPDATA%\Pub\Cache --> can be changed by specifying PUB_CACHE env variable
* macOS and Linux: user_home_directory/.pub-cache


`.packages` file is created with actual file paths but it's deprecated. See .dart_tool/package_config.json instead.
```
analyzer:file:///C:/Users/lucas.kim/AppData/Local/Pub/Cache/hosted/pub.dartlang.org/analyzer-2.3.0/lib/

```