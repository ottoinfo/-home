# /bin/sh
instances=11

for ((n=1; n<=$instances; n++))
do
((port=(11210+$n)))
memcached -m 24 -p $port -d
done