# 第3回実技試験ソースコード雛形

## 問題1

```java
public class Person1 {
  private String name;
  private int age;

  Person1(String name, int age) {

  }

  public String getName() {
    return "";
  }

  public int getAge() {
    return 0;
  }

  public void setName(String name) {

  }

  public void setAge(int age) {

  }

}
```

```java
public class Test31 {
  public static void main(String[] args) {
    Person1 person = new Person1("工大太郎", 20);
    // ここから書く

    // ここまで書く
    person.setName("工大次郎");
    person.setAge(19);
    // ここから書く

    // ここまで書く
  }
}
```

## 問題2

```java
public class Boss2 {
  private String name;
  private int gold;

  Boss2(String name, int gold) {
    this.name = name;
    this.gold = gold;
  }

  public void show() {
    System.out.println("「名前」"+this.name+"「所持金」"+this.gold);
  }
}
```

```java
public class Test32 {
  public static void main(String[] args) {
    if (args.length != 2) {
      System.out.println("引数はBoss名と所持金の2つです");
    } else {
      String name = args[0];
      int money = Integer.parseInt(args[1]);

      Boss2 boss = new Boss2(name, money);
      boss.show();
      UraBoss2 uraBoss = new UraBoss2(name, money);
      uraBoss.show();
    }
  }
}
```

## 問題3

```java
public class Hero3 {
  private String name;
  private int gold;

  Hero3(String name, int gold) {
  }

  @Override
  public String toString() {
    return "";
  }

}
```

```java
public class Test33 {
  public static void main(String[] args) {
    System.out.println("引数はHero名と所持金の2つです");
    String name = "hoge";
    int money = 0;

    Hero3 hero = new Hero3(name, money);
    System.out.println(hero);
  }
}
```

## 問題4

```java
public class Animal4 {
  private String name;
  private double weight;

  public double getWeight() {
    return weight;
  }

  public String getName() {
    return name;
  }

}
```

```java
import java.util.ArrayList;

public class Test34 {
  public static void main(String[] args) {
    ArrayList<Animal4> animals = new ArrayList<Animal4>();

    System.out.println("動物名を入力");
    System.out.println("体重を入力");

    System.out.println("「登録された動物の数は」");
    System.out.println("「2番目に登録された動物名は」");
    System.out.println("「2番目以外の動物一覧」");

  }
}
```

## 問題5

```java
public class Test35 {

  public static void main(String[] args) {
    System.out.println(args[0]);
  }
}
```
