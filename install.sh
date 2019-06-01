#!/bin/bash
# .から始まるファイル、ディレクトリへの
# シンボリックリンクをホームディレクトリに作成する

SCRIPT_DIR=$(cd $(dirname $0); pwd)

echo $SCRIPT_DIR

# .から始まり、アルファベットが続くもののみ抽出
# (.や..を除く)
for file in $(ls -a1 | grep -E "^\.[A-Za-z]")
do
    echo "Create Link $HOME/$file > $SCRIPT_DIR/$file"
    ln -s $SCRIPT_DIR/$file $HOME/
done
