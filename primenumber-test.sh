#!/bin/bash
tmp=/tmp/$$

ERROR_EXIT () {
 echo "$1" >&2
 rm -f $tmp-*
 exit 1
}

# テスト開始
# teat1: 引数が数値ではない
echo "数値を指定してください。" > $tmp-nat
./primenumber.sh a > $tmp-ans && ERROR_EXIT "test1-1: エラー終了しない場合にEXIT"
diff $tmp-ans $tmp-nat || ERROR_EXIT "test1-2: エラーメッセージが違う場合にEXIT"

# teat2: 引数がない
echo "引数に数値を指定してください。" > $tmp-noparam
./primenumber.sh > $tmp-ans && ERROR_EXIT "test2-1: エラー終了しない場合にEXIT"
diff $tmp-ans $tmp-noparam || ERROR_EXIT "test2-2: エラーメッセージが違う場合にEXIT"

# teat3: 引数が0
echo "0と1は素数ではありません。2以上を指定してください。" > $tmp-notprimenumber
./primenumber.sh 0 > $tmp-ans && ERROR_EXIT "test3-1: エラー終了しない場合にEXIT"
diff $tmp-ans $tmp-notprimenumber || ERROR_EXIT "test3-2: エラーメッセージが違う場合にEXIT"

# teat4: 引数が1
echo "0と1は素数ではありません。2以上を指定してください。" > $tmp-notprimenumber
./primenumber.sh 1 > $tmp-ans && ERROR_EXIT "test4-1: エラー終了しない場合にEXIT"
diff $tmp-ans $tmp-notprimenumber || ERROR_EXIT "test4-2: エラーメッセージが違う場合にEXIT"

# teat5: 引数が素数でない
echo "[8] は素数ではありません。" > $tmp-notprime
./primenumber.sh 8 > $tmp-ans || ERROR_EXIT "test5-1: エラー終了した場合にEXIT"
diff $tmp-ans $tmp-notprime || ERROR_EXIT "test5-2: メッセージが違う場合にEXIT"

# teat5: 引数が素数
echo "[5] は素数です。" > $tmp-prime
./primenumber.sh 5 > $tmp-ans || ERROR_EXIT "test5-3: エラー終了した場合にEXIT"
diff $tmp-ans $tmp-prime || ERROR_EXIT "test5-4: メッセージが違う場合にEXIT"

rm -f $tmp-*

