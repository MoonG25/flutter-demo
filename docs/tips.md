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