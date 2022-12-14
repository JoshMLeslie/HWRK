#!/bin/sh
# mkdir hwrk_copy
# cd hwrk_copy || exit

# git clone git@github.com:JoshMLeslie/HWRK.git

repos=("HWRK_W6D1" "HWRK_W5D5" "HWRK_W5D4" "HWRK_W5D2" "HWRK_W4D5" "HWRK_W4D4" "HWRK_W4D3" "HWRK_W4D1" "HWRK_W3D5" "HWRK_W3D4" "HWRK_W3D3" "HWRK_W3D1" "HWRK_W2D4" "HWRK_W2D3" "HWRK_W2D2")

for repo in "${repos[@]}"; do
	week=${repo:5:2}
	day=${repo:7:2}
	command="git subtree add --prefix=${week}/${day} git@github.com:JoshMLeslie/${repo}.git master"
	echo $command
	eval $command
done

echo "complete"
