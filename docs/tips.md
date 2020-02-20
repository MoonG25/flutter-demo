# Tips


## Spacer vs Expanded

Spacer를 사용하면 사이에 컴포넌트를 넣기 힘들다

Expanded(child: Container()) 는 같은 동작을 하지만 child 요소가 있기 때문에 더욱 쓸만하다.

## Click Text

찾을때마다 추가함

1. GestureDetector

```dart
GestureDetector(
  onTap: () => print('tap'),
  child: Text('tap me');
);
```

## Button width, height

1. SizedBox

```dart
// match parent
SizedBox(
  width: double.infinity,
  child: RaisedButton(...)
)

// specifix value
SizedBox(
  width: 100,
  child: RaisedButton(...)
)
```

2. ButtonTheme

```dart
ButtonTheme(
  minWidth: 200.0,
  height: 100.0,
  child: RaisedButton(...)
);
```

3. Container

```dart
Container(
  width: 200.0,
  height: 100.0,
  child: Raisedbutton(...)
);
```

## TextField width, height

1. Container

```dart
Container(
  width: 200.0,
  height: 100.0,
  child: TextField(...)
);
```

2. contentPadding

```dart
TextField(
  contentPadding: EdgeInsets.all(8.0),
  ,,,
)
```

## 위젯사이에 거리 조절하기

1. 위젯을 패딩을 줄 수 있는 위젯으로 감싸기

```dart
Container(
  margin: EdgeInsets.all(...),
  child: Widget()
)
```

2. SizedBox 추가하기

```dart
Column(
  children: [
    Widget(),
    SizedBox(height: 10.0),
    Widget()
  ]
)
```

## Drawer

1. Left Drawer

```dart
Scaffold(
  ...,
  appBar: AppBar(
    actions: [
      IconButton(
        icon: Icon(Icons.open),
        onPressed: () => Scaffold.of(context).openDrawer()
      )
    ]
  ),
  drawer: Drawer()
),
```

2. Right Drawer

```dart
Scaffold(
  ...,
  appBar: AppBar(
    actions: [
      IconButton(
        icon: Icon(Icons.open),
        onPressed: () => Scaffold.of(context).openEndDrawer()
      )
    ]
  ),
  endDrawer: Drawer()
),
```

## 리스트를 위젯 리스트로 변환

- map() 만 사용하는 경우

```dart
Column(
  children: list.map((data) => Widget(data)).toList(),
)
```

위 방식에서는 리턴하는 타입의 Widget이 아닌 경우 아래에 추가할 수 없다.

```dart
Column(
  children: list.map((data) => Widget(data))..toList().add(/*** Widget 과 같은 타입이어야함 ***/)
)
```

- for in 사용
이런 경우에는 아래와 같은 방식으로 처리할 수도 있다

```dart
Column(
  children: [
    for (var data in list) Widget(data),
    NewWidget(), // 가능
  ],
)
```

- 스프레드 사용

> 몰랐는데 다트에도 스프레드 있어서 이렇게 하는게 더 깔끔하다

```dart
Column(
  children: [
    ...list.map((data) => Widget(data)),
    NewWidget(),
  ]
)
```

## 위젯간 통신

- Child 에서 Parent 로 이벤트

```dart
// Child
class Child extends StatelessWidget {

  final ValueChanged<String> sendEvent;

  Child(this.sendEvent);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => sendEvent('hello'),
      child: Container(),
    );
  }
}

// Parent
class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Child(
        sendEvent: (msg) => print(msg),
      ),
    );
  }
}

```

## flutter 에서 key

## ListView

parent의 사이즈가 없으면 에러가 남

```dart
Container(
  height: 200.0,
  child: ListView();
);
```

## State 관리

- InheritedWidget

MediaQuery.of(context).size.width 처럼 참조

상태 변경에 따라서 알림을 하위 위젯들에게 할지 말지 결정하는 위젯

.of 메소드를 이용하여 상태를 다룰 수 있게 접근할 수 있다.

- Scoped Model

Stateful 위젯과 state를 사용할 필요가 사라지고 독립된 모델로 구성 가능

상위 위젯에서 하위 모델로 데이터 모델을 쉽게 전달할 수 있다.

Model class, ScopedModel 위젯, ScopedModelDescendant 위젯 등을 제공한다.

- Provider

디자인 패턴

데이터 공유나 로직의 분리를 간단히 할 수 있다

한 클래스가 하나의 역할만

데이터 공유 쉽게

중소규모 프로젝트에서 > Provider 패턴

대규모 프로젝트에서 > BLoc 패턴

생산과 소비로 나뉨

값을 이용하고 싶은 위젯을 Provider로 감싸면된다.

- BLoC

Presentation Layer와 Business Logic을 분리하여 코드를 작성할 수 있도록 해준다.

Bloc은 스트림을 이용하여 만들어지고 Widget은 Sink를 통해 Bloc에 이벤트를 보낸다.

Bloc객체는 Widget으로부터 이벤트를 전달받으면 필요한 Repository등으로부터 데이터를 전달받아 Business Logic을 처리한다.

Business Logic을 처리한 후 Bloc객체를 구독중인 UI 객체들에게 상태를 전달한다.

RxDart를 이용하거나 Bloc 라이브러리를 사용해서 구현하면 된다.