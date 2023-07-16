import os
import shutil
import datetime
import sys
import platform

# Function to get the Monday based on the current date and weekCount
def get_monday(weekCount):
    today = datetime.datetime.today()
    days_until_monday = (0 - today.weekday() + 7) % 7 + (weekCount - 1) * 7
    next_monday = today + datetime.timedelta(days=days_until_monday)
    return next_monday

# Check if an argument was passed
if len(sys.argv) > 1:
    print(f"Week variable is {sys.argv[1]}")
    weekCount = int(sys.argv[1])
else:
    print("Default week variable is 1")
    weekCount = 1

# Get the Monday based on the weekCount
nextMonday = get_monday(weekCount)

# Set all date variables
nextTuesday = nextMonday + datetime.timedelta(days=1)
nextWednesday = nextMonday + datetime.timedelta(days=2)
nextThursday = nextMonday + datetime.timedelta(days=3)
nextFriday = nextMonday + datetime.timedelta(days=4)
nextSaturday = nextMonday + datetime.timedelta(days=5)
nextSunday = nextMonday + datetime.timedelta(days=6)

weekOfDate = nextMonday.strftime("%B%d")
year = nextMonday.strftime("%Y")
monthFolder = nextMonday.strftime("%m_%B")

# Setup "WeekOfXYZ" string
weekOfPrefix = "WeekOf"
folderName = weekOfPrefix + weekOfDate

# Set the correct file extension
fileExtension = ".ap"

# Determine the base directory based on the operating system
if platform.system() == "Darwin":  # macOS
    baseDir = "/Users/adam/GitHub/Documents"
elif platform.system() == "Windows":
    baseDir = "C:\\Users\\acroft\\Documents\\Self\\Documents"  # Modify the Windows path accordingly
else:
    print("Unsupported operating system.")
    sys.exit(1)

# Set the current year, month, and working directory
dir = os.path.join(baseDir, "Planner", year, monthFolder, folderName)
yearDir = os.path.join(baseDir, "Planner", year)
monthDir = os.path.join(baseDir, "Planner", year, monthFolder)

# Check if a folder for the current year exists and make it if it doesn't
if not os.path.isdir(yearDir):
    os.makedirs(yearDir)
else:
    print(f"Year {year} found...")

if not os.path.isdir(monthDir):
    os.makedirs(monthDir)
else:
    print(f"Month {monthFolder} found...")

os.makedirs(dir, exist_ok=True)

if not os.path.isfile(os.path.join(dir, "WeeklyTemplate.ap")):
    print("Copying weekly template...")
    shutil.copy(os.path.join(baseDir, "Planner", "Templates", "WeeklyTemplate.ap"), os.path.join(dir, folderName + fileExtension))
    print("Copying daily template...")
    shutil.copy(os.path.join(baseDir, "Planner", "Templates", "DailyTemplate_Oak.ap"), os.path.join(dir, nextMonday.strftime("%B%d_%Y") + fileExtension))
else:
    os.rename(os.path.join(dir, "WeeklyTemplate.ap"), os.path.join(dir, folderName + fileExtension))
    os.rename(os.path.join(dir, "DailyTemplate_Oak.ap"), os.path.join(dir, nextMonday.strftime("%B%d_%Y") + fileExtension))

shutil.copy(os.path.join(dir, nextMonday.strftime("%B%d_%Y") + fileExtension), os.path.join(dir, nextTuesday.strftime("%B%d_%Y") + fileExtension))
shutil.copy(os.path.join(dir, nextTuesday.strftime("%B%d_%Y") + fileExtension), os.path.join(dir, nextWednesday.strftime("%B%d_%Y") + fileExtension))
shutil.copy(os.path.join(dir, nextWednesday.strftime("%B%d_%Y") + fileExtension), os.path.join(dir, nextThursday.strftime("%B%d_%Y") + fileExtension))
shutil.copy(os.path.join(dir, nextThursday.strftime("%B%d_%Y") + fileExtension), os.path.join(dir, nextFriday.strftime("%B%d_%Y") + fileExtension))
shutil.copy(os.path.join(dir, nextFriday.strftime("%B%d_%Y") + fileExtension), os.path.join(dir, nextSaturday.strftime("%B%d_%Y") + fileExtension))
shutil.copy(os.path.join(dir, nextSaturday.strftime("%B%d_%Y") + fileExtension), os.path.join(dir, nextSunday.strftime("%B%d_%Y") + fileExtension))
print("...documents created.")
