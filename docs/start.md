# Flutter 시작하기

[홈페이지](flutter.io)

1. 홈페이지에서 Flutter를 다운받아서 압축을 푼다.
2. Flutter 경로를 환경변수에 추가한다.
3. 사용하는 개발툴에 Flutter 플러그인을 설치한다.
4. flutter doctor 를 입력하여 필요한 것들을 확인 후 설치한다.

## 안드로이드 스튜디오를 사용하는 경우

- [New Flutter Project] 를 눌러서 새로운 프로젝트 생성
- AVD 를 만들고 먼저 실행을 한다. (먼저 실행해야 플루터 프로젝트를 시작할 수 있다)

## 디렉토리 구조

- android
  - 안드로이드 프로젝트 경로
- assets
  - 리소스 파일을 저장하는 곳
- ios
  - ios 프로젝트 경로
- lib
  - dart 파일을 작성하는 디렉토리다.
- pubspec.yaml
  - pom.xml 같은 역할을 가지고있다.
  - 앱에서 이미지를 사용하려면 여기에 적어줘야한다.

## main.dart

main 함수에서 runApp 함수를 호출하여 앱을 실행한다.