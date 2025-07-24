#!/bin/sh                                                                                                                                  
rm x??
#inputfile
xyzfile=$1

#number of atoms based on xyz header
numatm=`head -1 $xyzfile`

#number of lines in each xyz frame
numline=$(($numatm + 2))

#slits file into each frame
split -d --numeric-suffixes=1 -l $numline $xyzfile

#finds out howmany frames there are
totlines=`wc -l $xyzfile | awk '{print $1}'`
numframes=$(($totlines / $numline))

for i in `seq -w 1 $numframes`;
do
    j=$(($numframes + 1 - ${i#0} ))
    echo $j
    cp x${i} renum_${j}
done

rm reversed_traj.xyz
for x in `seq 1 $numframes`;
do
   cat renum_${x} >> reversed_traj.xyz
done
    
    


