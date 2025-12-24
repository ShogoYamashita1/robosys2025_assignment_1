# shuffleコマンド
![test](https://github.com/ShogoYamashita1/robosys2025_assignment_1/actions/workflows/test.yml/badge.svg)

標準入力から読み込んだ要素をランダムに入れ替えて出力するコマンドです。

## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.7〜3.14

## テスト環境
 - Ubuntu 24.04 LTS

## 使い方
```bash
$ git clone git@github.com:ShogoYamashita1/robosys2025_assignment_1.git
$ cd robosys2025_assignment_1
$ seq 5 | ./shuffle
4
1
3
5
2
```

## 説明
このコマンドは標準入力から読み込んだ要素を、ランダムに入れ替えて出力するコマンドです。  
入力が1行の場合を除き、必ず入力と異なる出力になる仕様となっています。  
また、入力は数字・英字・日本語入力すべてを入れ替えます。  
利用目的としてソートコマンド等のテストへの利用を想定して制作しました。

## 著作権
このリポジトリはMITライセンスで提供しています。  
詳細はLICENSEファイルを参照してください。  
© 2025 Shogo Yamashita
