# Nim-ACL
ACL (AtCoder Library) のNimによる実装です。
ACLで実装されているものはexpander含めてすべてNimに変換しています。
一部、Nim向けに使いやすくなるような仕様も追加しました。

## expander
Nim-ACLによるimport, includeをすべて展開します。コマンドは本家ACLのものと同じです。
Nim-ACLはatcoderのジャッジ環境では呼び出せませんがexpanderで展開することで、atcoderでもコンパイル可能なコードを生成することが可能です。
online-judge-tools, atcoder-toolsなどの自動提出機能のあるツールと合わせて展開と提出を同時に行うようにすると便利です。

## extra
ACLにないがよく使いそうなライブラリを独自に実装しています。
例えば、グラフ関連の処理(ダイクストラ法等)や累積和ライブラリなどがあります。こちらもexpanderで展開可能です。
大体、以下のスタンスで実装していきます。
* 仕様等はACLのものに統一(例: segtreeにおけるmapping, composition等の名称を二分木等の名称でも統一)
* 内部の処理にACLで実装済みのアルゴリズムが必要になった場合はACLのものを用いる
* C++, python等の他の主要言語の標準ライブラリと同等かそれ以上の環境を提供する。特に他の言語で標準搭載であるがNimでは実装されていないものも実装する。例えばC++におけるset/multiset, map/multiset, bitset等が該当し、SortedSet/SortedMultiSet, SortedMap/SortedMultiMap, BitSetという名前で実装しました。
  * これについては、どこまでやるかはちょっと悩みどころです。例えば、pythonのnumpyやC++のboostとかまでやろうとするとかなり大変そうです。
* 本家ACLほどの万全なサポートは行わないが、test, verifyはできるだけ書く
* READMEもできるだけ書く(英訳はできないかも)
* 将来ACLに実装された場合は順次そちらに置き換える

# References
- https://atcoder.jp/posts/517?lang=ja
