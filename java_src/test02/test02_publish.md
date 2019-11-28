# 第２回実技試験ソースコード雛形

## 問題3: 食材の価格

```java
class Food {
  String name;
  int price;
  int weight;


  public void printData() {    }

  public double pricePerGram() {    }

  public int calcPrice(int weight) {    }
}
```

## 問題4: 成績の算出と比較

```java
public class Student {
  String name;
  int mini;
  int fin;

  Student(String n, int m, int f) {
  }

  public int calcGrade() {
  }

  public void printGrade() {
  }

  public void compareGrade(Student s) {
  }
}
```

## 問題5: 合否判定

```java
class StScore {
  public int id;
  public String name;
  public int[] score;

  public void printScore() {
    System.out.printf("%d %s %3d点 %3d点 %3d点 ", this.id, this.name, 99, 99, 99);
    if(true) {
      System.out.printf("合格\n");
    }else {
      System.out.printf("不合格\n");
    }
  }
}
```

```java
import java.util.Scanner;

class Test25 {
  public static void main(String[] args) {
    StScore st1 = new StScore();
    st1.id = 19991;
    st1.name = "工大太郎";

    StScore st2 = new StScore();
    st2.id = 19992;
    st2.name = "枚方花子";

    Scanner sc = new Scanner(System.in);
    System.out.println(st1.name + "の2回の中間テストの点数を入力してください");

    System.out.println(st2.name + "の2回の中間テストの点数を入力してください");

    System.out.println("   ID     Name Exam1 Exam2   Max Accept");
    st1.printScore();
    st2.printScore();

    sc.close();
  }
}
```
