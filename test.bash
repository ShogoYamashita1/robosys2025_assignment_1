#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Shogo Yamashita
# SPDX-License-Identifier: MIT

### 異常終了関数 ###
# テスト終了時にも表示できるようng_lineで失敗した行を記録
ng () {
    if [ "${1}" != 0 ]; then
        echo ${1}行目で失敗しました
        res=1
    fi
}

res=0
ng_line=0

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
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


### 通常入力 ###
seq 5 | ./shuffle
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

echo "A\nB\nC\n" | ./shuffle
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


### 特殊入力 ###
echo "a\n\n1\n1.33\n" | ./shuffle
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

echo "A" | ./shuffle
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

echo a | ./shuffle
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

echo ? | ./shuffle
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

echo @ | ./shuffle
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

echo | ./shuffle
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


### テスト結果 ###
ng "$ng_line"
if [ "${res}" = 0 ]; then
    echo -e "\e[32mAll test cases passed successfully.\e[0m"
else
    echo -e "\e[31mTest failed\e[0m"
fi

exit $res
