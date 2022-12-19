function simpleBuild(){
	echo "Running simple planner build..."
	if [ ! -f "${dir}WeeklyTemplate.ap" ]; then
		echo "Copying weekly..."
		cp /Users/adam/GitHub/Documents/Planner/Templates/WeeklyTemplate.ap $dir$folderName$fileExtension
		echo "Copying daily..."
		cp /Users/adam/GitHub/Documents/Planner/Templates/DailyTemplate_Oak.ap $dir$nextMonday$fileExtension
	else
		mv ${dir}WeeklyTemplate.ap $dir$folderName$fileExtension
		mv ${dir}DailyTemplate_Oak.ap $dir$nextMonday$fileExtension
	fi

	cp $dir$nextMonday$fileExtension $dir$nextTuesday$fileExtension
	cp $dir$nextTuesday$fileExtension $dir$nextWednesday$fileExtension
	cp $dir$nextWednesday$fileExtension $dir$nextThursday$fileExtension
	cp $dir$nextThursday$fileExtension $dir$nextFriday$fileExtension
	cp $dir$nextFriday$fileExtension $dir$nextSaturday$fileExtension
	cp $dir$nextSaturday$fileExtension $dir$nextSunday$fileExtension
	echo "...documents created."
}

if [ ! -f "$1" ]
then
	echo "equal to 0"
	weekCount=2
else
	weekCount=$1
fi

if [ $weekCount -gt 0 ]
then
	echo "Greater than 0"
# Set all date variables
	nextMonday=$(date -j -v-mon -v+${weekCount}w "+%B%d_%Y")
	nextTuesday=$(date -j -v-mon -v+${weekCount}w -v+1d "+%B%d_%Y")
	nextWednesday=$(date -j -v-mon -v+${weekCount}w -v+2d "+%B%d_%Y")
	nextThursday=$(date -j -v-mon -v+${weekCount}w -v+3d "+%B%d_%Y")
	nextFriday=$(date -j -v-mon -v+${weekCount}w -v+4d "+%B%d_%Y")
	nextSaturday=$(date -j -v-mon -v+${weekCount}w -v+5d "+%B%d_%Y")
	nextSunday=$(date -j -v-mon -v+${weekCount}w -v+6d "+%B%d_%Y")
	weekOfDate=$(date -j -v-mon -v+${weekCount}w "+%B%d")
else
	nextMonday=$(date -j -v-mon -v-${weekCount}w "+%B%d_%Y")
	nextTuesday=$(date -j -v-mon -v-${weekCount}w -v+1d "+%B%d_%Y")
	nextWednesday=$(date -j -v-mon -v-${weekCount}w -v+2d "+%B%d_%Y")
	nextThursday=$(date -j -v-mon -v-${weekCount}w -v+3d "+%B%d_%Y")
	nextFriday=$(date -j -v-mon -v-${weekCount}w -v+4d "+%B%d_%Y")
	nextSaturday=$(date -j -v-mon -v-${weekCount}w -v+5d "+%B%d_%Y")
	nextSunday=$(date -j -v-mon -v-${weekCount}w -v+6d "+%B%d_%Y")
	weekOfDate=$(date -j -v-mon -v-${weekCount}w "+%B%d")
fi

# Setup "WeekOfXYZ" string
weekOfPrefix="WeekOf"
folderName="$weekOfPrefix$weekOfDate"

# Set the correct file extension
fileExtension=".ap"

# Set the current year, month, and working directory
year=$(date -j "+%Y")
monthFolder=$(date -j "+%m_%B")
dir="/Users/adam/GitHub/Documents/Planner/$year/$monthFolder/$folderName/"
yearDir="/Users/adam/GitHub/Documents/Planner/$year"
monthDir="/Users/adam/GitHub/Documents/Planner/$year/$monthFolder"

# Look for -f or -s flags for full planner build or simple planner build
echo "Running full build"

# Check if a folder for the current year exists and make it if it
# doesn't
if [ ! -d "$yearDir" ]; then
	mkdir $yearDir
else
	echo "Year $year found..."
fi

if [ ! -d "$monthDir" ]; then
	mkdir $monthDir
else
	echo "Month $monthFolder found..."
fi

mkdir $dir

simpleBuild
