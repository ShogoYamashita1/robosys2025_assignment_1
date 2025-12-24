#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Shogo Yamashita
# SPDX-License-Identifier: MIT

ng () {
        echo ${1}行目で失敗しました
        res=1
}

res=0

### 要素チェック ###
shuffle_out=$(./shuffle < input_test.txt | sort)
test_input=$(sort input_test.txt)
if [ "$shuffle_out" = "$test_input" ]; then
    res=0
else
    ng "$LINENO"
fi


### 行数,単語数,バイト数  ###
input_filesize=0
shuffle_filesize=0

input_filesize=$(wc < input_test.txt)
shuffle_filesize=$(./shuffle < input_test.txt | wc)
if [ "$input_filesize" = "$input_filesize" ]; then
    res=0
else
    ng "$LINENO"
fi


### 変換されているかテスト ###
diff -q <(./shuffle < input_test.txt) input_test.txt
[ "$?" = 1 ] || ng "$LINENO"


### 通常入力 ###
out=$(seq 5 | ./shuffle)
[ "$?" = 0 ] || ng "$LINENO"

out=$(echo "A\nB\nC\n" | ./shuffle)
[ "$?" = 0 ] || ng "$LINENO"


### 特殊入力 ###
out=$(echo "a\n\n1\n1.33\n" | ./shuffle)
[ "$?" = 0 ] || ng "$LINENO"

out=$(echo "A" | ./shuffle)
[ "$?" = 0 ] || ng "$LINENO"

out=$(echo a | ./shuffle)
[ "$?" = 0 ] || ng "$LINENO"

out=$(echo ? | ./shuffle)
[ "$?" = 0 ] || ng "$LINENO"

out=$(echo @ | ./shuffle)
[ "$?" = 0 ] || ng "$LINENO"

out=$(echo | ./shuffle)
[ "$?" = 0 ] || ng "$LINENO"


### テスト結果 ###
[ "${res}" = 0 ] && echo OK
exit $res
