#!/bin/sh

# Pastikan variabel $uid dan $proxy terdefinisi sebelum digunakan
if [ -z "$uid" ]; then
  echo "Error: Variabel \$uid tidak terdefinisi."
  exit 1
fi

if [ -z "$proxy" ]; then
  echo "Error: Variabel \$proxy tidak terdefinisi atau kosong."
  exit 1
fi

if [ -z "$threads" ]; then
  threads=1
fi

echo " " > /grass/data/wallets.txt

for i in $(seq 1 $threads); do
  echo "$uid" >> /grass/data/accounts.txt
done

curl -o /grass/data/proxies.txt "$proxy"
if [ $? -ne 0 ]; then
  echo "Error: Gagal mengunduh file proxy dari URL $proxy."
  exit 1
fi

exec "$@"
