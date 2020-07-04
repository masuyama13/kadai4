#!/bin/bash

result="/tmp/$$-result"
ans="/tmp/$$-ans"

ERROR_EXIT(){
       echo $1
rm /tmp/$$-* exit 1
}

# 成功したときの動作確認
# 同じ：数字1と1
./divisor.sh 1 1 > ${result}
echo 1 > /tmp/$$-ans
diff /tmp/$$-result /tmp/$$-ans || ERROR_EXIT 1 "テスト失敗"
# 同じ：数字10と25
./divisor.sh 10 25 > /tmp/$$-result
echo 5 > /tmp/$$-ans
diff /tmp/$$-result /tmp/$$-ans || ERROR_EXIT "2 テスト失敗"

# 失敗したときの動作
./divisor.sh 1 2> /tmp/$$-result && ERROR_EXIT "3-1: エラー終了しない"
echo "引数として自然数を2個入れてください" > /tmp/$$-ans
diff /tmp/$$-result /tmp/$$-ans || ERROR_EXIT "3-1: エラーメッセージが違う"

./divisor.sh -5 3 2> /tmp/$$-result && ERROR_EXIT "4-1: エラー終了しない"
echo "引数は1以上の整数です" > /tmp/$$-ans
diff /tmp/$$-result /tmp/$$-ans || ERROR_EXIT "4-2: エラーメッセージが違う"

if [ -f /tmp/$$-err ]; then
        cat /tmp/$$-err
        rm /tmp/$$-*
        exit 1
fi

rm /tmp/$$-*
