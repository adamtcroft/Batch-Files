# Set all date variables
nextMonday=$(date -j -v-mon -v+1w "+%B%d_%Y")
nextTuesday=$(date -j -v-mon -v+1w -v+1d "+%B%d_%Y")
nextWednesday=$(date -j -v-mon -v+1w -v+2d "+%B%d_%Y")
nextThursday=$(date -j -v-mon -v+1w -v+3d "+%B%d_%Y")
nextFriday=$(date -j -v-mon -v+1w -v+4d "+%B%d_%Y")
nextSaturday=$(date -j -v-mon -v+1w -v+5d "+%B%d_%Y")
nextSunday=$(date -j -v-mon -v+1w -v+6d "+%B%d_%Y")

# Setup "WeekOfXYZ" string
weekOfPrefix="WeekOf"
weekOfDate=$(date -j -v-mon -v+1w "+%B%d")
folderName="$weekOfPrefix$weekOfDate"

# Set the correct file extension
fileExtension=".ap"

# Set the current year, month, and working directory
year=$(date -j "+%Y")
monthFolder=$(date -j "+%m_%B")
dir="/Users/adam/GitHub/Documents/Planner/$year/$monthFolder/$folderName/"

# Look for -f or -s flags for full planner build or simple planner build
while getopts ":fs" options; do
	case "${options}" in
		# TODO: Run full planner build
		f)
			echo "Placeholder for full build"
			#exit 0
			;;
		# Simple planner just renames templates and copies files to correct
		# naming convention
		s)
			echo "Running simple planner build..."
			mv ${dir}WeeklyTemplate.ap $dir$folderName$fileExtension
			mv ${dir}DailyTemplate_Oak.ap $dir$nextMonday$fileExtension
			cp $dir$nextMonday$fileExtension $dir$nextTuesday$fileExtension
			cp $dir$nextTuesday$fileExtension $dir$nextWednesday$fileExtension
			cp $dir$nextWednesday$fileExtension $dir$nextThursday$fileExtension
			cp $dir$nextThursday$fileExtension $dir$nextFriday$fileExtension
			cp $dir$nextFriday$fileExtension $dir$nextSaturday$fileExtension
			cp $dir$nextSaturday$fileExtension $dir$nextSunday$fileExtension
			echo "...documents created."
			;;
		:)
			echo "No argument provided"
			echo "Please use -f for full planner copy or -s for simple planner
			copy"
			;;
	esac
done
