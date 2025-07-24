#!bin/sh
rm -rf gvfiles
mkdir gvfiles
for file in *.log; 
do 
    echo "$file"
    ~/gauss_utils/g16tog09.sh $file
    mv gv5* gvfiles
    rm *arch    
done
