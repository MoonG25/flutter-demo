# Dart

Dart is a client-optimized language for fast apps on any platform

## Install

[Homepage](dart.dev)

홈페이지에서 문서보고 설치하면 된다.

- install dart

```bash
$ brew tap dart-lang/dart
$ brew install dart
```

- install pub

dart 설치하면 자동으로 설치된다.

- install stagehand

dart 프로젝트 생성기이다.
stagehand 로 프로젝트를 생성하고 pub get 명령어로 필요한 패키지를 내려받아야한다.

```bash
$ pub global activate stagehand
$ stagehand [templates]
$ pub get
```

templates 종류

- console-full
- package-simple
- server-shelf
- web-angular
- web-simple
- web stagexl

## 핵심 특징

1. 모든 것들이 전부 Object로 취급

- variable 안에 넣을 수 있는 것은 전부 Object
- function, number, null 전부 Object로 취급
- 변수에 넣을 수 있는 모든 것은 객체이며, 모든 객체는 클래스의 인스턴스로 취급

2. List<int>, List<dynamic> 같은 제네릭 타입을 지원

- List<dynamic> list = [1, 2, "3", 4, true] 같은 형식이 가능

3. Typed 언어지만 자유도를 준다.

- var, dynamic으로 선언하면 동적타입으로 사용가능
- var
  - 타입을 지정하지 않아도 다트에서 추측을 함.
  - 다른 타입으로 변환 불가능
- dynamic
  - 모든 다트 객체의 기본 Object
  - 명시적으로 사용
  - 서로 다른 타입을 지정할 수 있음
  - 다른 타입으로 변환 불가능

4. public, private, protected의 정의가 없으며 _function() 으로 정의된다.

- private인 _는 class안에서만 접근 가능한 것이 아닌 다트 페이지 단위로 private 정의