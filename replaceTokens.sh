> temp1
cp $1 temp2
while read p; do
IFS='=' read -a myarray <<< "$p"
token="${myarray[0]}"
value=${myarray[1]}
while read q; do
if [[ $q == *\[\[$token\]\]* ]]; then
echo $q | sed -e "s/\[\[${token}\]\]/${value}/g" >> temp1
else
echo $q >> temp1
fi
done < temp2
cp temp1 temp2
> temp1
done < $2
cp temp2 $3
rm temp1
rm temp2